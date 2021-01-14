class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'assets/images/storm.jpg';
    } else if (condition < 400) {
      return 'assets/images/drizzle.jpg';
    } else if (condition < 600) {
      return 'assets/images/rain.jpg';
    } else if (condition < 700) {
      return 'assets/images/snow.jpg';
    } else if (condition == 800) {
      return 'assets/images/sunny.jpg';
    } else if (condition < 900) {
      return 'assets/images/windy.jpg';
    }
  }

  String getMessege (int condition) {
    if (condition < 300) {
      return 'Storm - Better if you stay home';
    } else if (condition < 400) {
      return 'Drizzle - Bring an ☔ just in case';
    } else if (condition < 600) {
      return 'Rain - Don\'t forget your 🧥';
    } else if (condition < 700) {
      return 'Snowy - It\'s 🍦 time';
    } if (condition == 800) {
      return 'Sunny - Get your 👙 ready';
    } if (condition < 900) {
      return 'Windy - Might catch a cold';
    }
  }

  String getWeather (int condition) {
    if (condition < 300) {
      return 'Thunderstorm';
    } else if (condition < 400) {
      return 'Drizzle';
    } else if (condition < 600) {
      return 'Rain';
    } else if (condition < 700) {
      return 'Snow';
    } if (condition < 900) {
      return 'Sunny';
    }
  }
}