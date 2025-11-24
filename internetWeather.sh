        #!/usr/bin/env bash
        hourIndex=$(date +%H)
        currentTemp=$(curl -s "https://api.open-meteo.com/v1/forecast?latitude=36.1628&longitude=-85.5016&hourly=precipitation_probability&current=temperature_2m&timezone=auto&forecast_days=3&wind_speed_unit=mph&temperature_unit=fahrenheit&precipitation_unit=inch" | jq -r ".current.temperature_2m")
        firstHour=$(curl -s "https://api.open-meteo.com/v1/forecast?latitude=36.1628&longitude=-85.5016&hourly=precipitation_probability&current=temperature_2m&timezone=auto&forecast_days=3&wind_speed_unit=mph&temperature_unit=fahrenheit&precipitation_unit=inch" | jq -r ".hourly.precipitation_probability[$hourIndex]")
        secondHour=$(curl -s "https://api.open-meteo.com/v1/forecast?latitude=36.1628&longitude=-85.5016&hourly=precipitation_probability&current=temperature_2m&timezone=auto&forecast_days=3&wind_speed_unit=mph&temperature_unit=fahrenheit&precipitation_unit=inch" | jq -r ".hourly.precipitation_probability[$(($hourIndex + 1))]")
        thirdHour=$(curl -s "https://api.open-meteo.com/v1/forecast?latitude=36.1628&longitude=-85.5016&hourly=precipitation_probability&current=temperature_2m&timezone=auto&forecast_days=3&wind_speed_unit=mph&temperature_unit=fahrenheit&precipitation_unit=inch" | jq -r ".hourly.precipitation_probability[$(($hourIndex + 2))]")
        convertTemp=$(printf "%.0f" "$currentTemp")
        avgPrecipitation=$(( ($firstHour + $secondHour + $thirdHour) / 3 ))

        currentTime=$(date +%H:%M)
        meridiem=$(date +%p)
        echo "Current Time: $currentTime $meridiem"
        echo "It is currently "$convertTemp"F in Cookeville, TN, with a "$avgPrecipitation"% to rain in the next three hours."

        #if else statement  

        if [ "$avgPrecipitation" -gt 50 ]; then
            echo "My recomendation: Umbrella!"
        elif [ "$convertTemp" -gt 65 ]; then
            echo "My recommendation: Shorts!"
        else
            echo "My recommendation: Jacket!"
        fi





