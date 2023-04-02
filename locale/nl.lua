local Translations = {
    dialog = {
        header = "Weet je het zeker?",
        content = "Om binnen te komen, is er een entreegeld. Weet je zeker dat je naar binnen wilt gaan?",
    },

    error = {
        not_enough_money = "Je hebt niet genoeg geld",
        no_washable_money = "Je hebt geen geld om te wassen"
    },

    progress = {
        washing = "Geld wassen",
        drying = "Geld drogen",
        printing = "Geld afdrukken",
        canceled = "Je hebt de actie geannuleerd",
    },

    targets = {
        enter = "Geld wassen",
        exit = "Ga naar buiten",
        wash = "Geld wassen",
        dry = "Geld drogen",
        print = "Geld afdrukken",
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
