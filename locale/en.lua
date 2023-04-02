local Translations = {
    dialog = {
        header = "Are you sure?",
        content = "To enter, there is an entrance fee. Are you sure you want to go in?",
    },

    error = {
        not_enough_money = "You do not have enough money",
        no_washable_money = "You do not have any money to wash"
    },

    progress = {
        washing = "Washing money",
        drying = "Drying money",
        printing = "Printing money",
        canceled = "You canceled the action",
    },

    targets = {
        enter = "Wash money",
        exit = "Exit",
        wash = "Wash money",
        dry = "Dry money",
        print = "Print money",
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
