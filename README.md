# Geocoding API [![Maintainability](https://api.codeclimate.com/v1/badges/11b83f34c9f9eeaf7992/maintainability)](https://codeclimate.com/github/brunossilveira/asanarebel/maintainability)

This is a simple API application to retrieve location data (latitude and longitude) from addresses.
It uses Google Maps Geocoding API to get the location data.

## General information

* [Rails 5 (--api)](http://rubyonrails.org/)
* [RSpec](http://rspec.info/)
* [HTTParty](https://github.com/jnunemaker/httparty)
* [Webmock](https://github.com/bblimke/webmock)
* [Google Maps Geocode API](https://developers.google.com/maps/documentation/geocoding/intro)
* [Dotenv](https://github.com/bkeepers/dotenv)

## Usage

First, you need to [create](https://developers.google.com/maps/documentation/geocoding/get-api-key) an api key.
Then, you need to set the api key as an environment variable. Do to that, just create a `.env` file and set the value there:

```
GOOGLE_GEOCODE_API_KEY=<your_api_key>
```

After that, just boot the server:
`rails s`

And voila, you start getting locations:

```
# GET locations

localhost:3000/locations?address=<address>
```

Response:

```json
  { latitude: 10, longitude: 10 }
```

If the address is invalid or some error happened with the google maps api, you will get an error instead:

```json
  { error: error message }
```

## Tests

To run the tests just

`rspec`
