extends Node

const saveDataPath = "res://savedData.json"

var defaultSaveData = {
    highScore = 0,
    scores = [],
}

func saveDataToFile(saved_data):
    var jsonString = to_json(saved_data)
    var saveFile = File.new()
    saveFile.open(saveDataPath, File.WRITE)
    saveFile.store_line(jsonString)
    saveFile.close()

func loadDataFromFile():
    var savedFile = File.new();
    if not savedFile.file_exists(saveDataPath):
        return defaultSaveData
    
    savedFile.open(saveDataPath, File.READ)
    var data = parse_json(savedFile.get_as_text());
    savedFile.close()

    return data