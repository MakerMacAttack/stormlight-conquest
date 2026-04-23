extends Control


class_name Redeployment


@onready var select_from: OptionButton = $vBoxContainer/hBoxContainer/fromContainer/selectFrom
@onready var select_to: OptionButton = $vBoxContainer/hBoxContainer/toContainer/selectTo
@onready var select_amount: OptionButton = $vBoxContainer/hBoxContainer/amountContainer/selectAmount

@onready var deploy_button: Button = $vBoxContainer/deployButton


var allRegions: Array[Region]
var currentPlayer: Player
var fromOptions: Array[Region]:
	set(newFroms):
		fromOptions = newFroms
		select_from.clear()
		select_from.add_item("-")
		if fromOptions.size() > 0:
			for from in fromOptions:
				select_from.add_item(from.displayName)
var selectedFrom: Region:
	set(newFrom):
		selectedFrom = newFrom
# make a setter which triggers population toOptions and amountOptions
		selectedTo = null
		selectedAmount = 0
		amount = selectedFrom.troops - 1
		populateTo()
# it should also disable the Deploy button
		deploy_button.disabled = true

var toOptions: Array[Region]:
	set(newTos):
		toOptions = newTos
		select_to.clear()
		select_to.add_item("-")
		for to in toOptions:
			select_to.add_item(to.displayName)
var selectedTo: Region:
	# make a setter that checks to enable the Deploy button
	set(pickedTo):
		selectedTo = pickedTo
		checkCanDeploy()

var amount: int:
	set(newAmount):
		amount = newAmount
		select_amount.clear()
		select_amount.add_item("-")
		if newAmount > 0:
			for i in amount:
				select_amount.add_item(str(i+1))
var selectedAmount: int:
	# make a setter that checks to enable the Deploy Button
	set(pickedAmount):
		selectedAmount = pickedAmount
		checkCanDeploy()

func checkCanDeploy() -> void:
	deploy_button.disabled = !(selectedAmount > 0 && selectedTo != null)

func populateTo() -> void:
	var possibleTos: Array[Region] = []
	for region in allRegions:
		if region.currentOwner == currentPlayer && selectedFrom.borders.has(region.manualId):
			possibleTos.append(region)
	toOptions = possibleTos


func _on_from_selected(index: int) -> void:
	selectedFrom = fromOptions[index - 1]

func _on_to_selected(index: int) -> void:
	selectedTo = toOptions[index - 1]

func _on_amount_selected(index: int) -> void:
	selectedAmount = index

func _on_deploy_pressed() -> void:
	selectedFrom.troops -= selectedAmount
	selectedTo.troops += selectedAmount
	SignalHub.onRedeploymentEnd()


func _on_skip_pressed() -> void:
	SignalHub.onRedeploymentEnd()
