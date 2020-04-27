class StatusGlobal {
    int infected;
    int deaths;
    int recovered;
    int newCases;
    int newDeaths;

    StatusGlobal({this.infected, this.deaths,
            this.recovered, this.newCases, this.newDeaths});

    StatusGlobal.fromJson(Map<String, dynamic> json) {
        infected = json['total_cases'];
        deaths = json['total_deaths'];
        recovered = json['total_recovered'];
        newCases = json['total_new_cases_today'];
        newDeaths = json['total_new_deaths_today'];
    }
}
