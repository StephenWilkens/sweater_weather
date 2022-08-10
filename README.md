# README

# API Usage
- Base URL:     `http://localhost:3000`


- Available Endpoints:
	- [Forecast](#FORECAST)
	- [Users](#USERS)
	- [Sessions](#SESSIONS)
  - [Road Trip](#ROADTRIP)
  
  ---
  
  # FORECAST
  
  **Get Forecast information**
  
  - This endpoint consumes data from a weather api and returns the parsed information.
  
  ``` ruby
  [GET] /api/v1/forecast
  
  Required PARAMS: 
 - location
```

Example:

``` ruby 
[GET] /api/v1/forecast?location=denver,co

- Headers: Content-Type: application/json
           Accept: application/json
```

RESPONSE:

```json
{:data=>
  {:id=>nil,
   :type=>"forecast",
   :attributes=>
    {:current_weather=>
      {:datetime=>"2022-08-09T17:56:34.000-06:00",
       :sunrise=>"2022-08-09T06:06:29.000-06:00",
       :sunset=>"2022-08-09T20:04:28.000-06:00",
       :temperature=>91.62,
       :feels_like=>88.2,
       :humidity=>22,
       :uvi=>0.96,
       :conditions=>"scattered clouds",
       :icon=>"03d"},
     :daily_weather=>
      [{:date=>"2022-08-09",
        :sunrise=>"2022-08-09T06:06:29.000-06:00",
        :sunset=>"2022-08-09T20:04:28.000-06:00",
        :max_temp=>92.08,
        :min_temp=>71.35,
        :conditions=>"clear sky",
        :icon=>"01d"},
       {:date=>"2022-08-10",
        :sunrise=>"2022-08-10T06:07:26.000-06:00",
        :sunset=>"2022-08-10T20:03:15.000-06:00",
        :max_temp=>92.95,
        :min_temp=>71.8,
        :conditions=>"clear sky",
        :icon=>"01d"},
       {:date=>"2022-08-11",
        :sunrise=>"2022-08-11T06:08:23.000-06:00",
        :sunset=>"2022-08-11T20:02:01.000-06:00",
        :max_temp=>95.7,
        :min_temp=>72.1,
        :conditions=>"clear sky",
        :icon=>"01d"},
       {:date=>"2022-08-12",
        :sunrise=>"2022-08-12T06:09:20.000-06:00",
        :sunset=>"2022-08-12T20:00:45.000-06:00",
        :max_temp=>95,
        :min_temp=>73.38,
        :conditions=>"clear sky",
        :icon=>"01d"},
       {:date=>"2022-08-13",
        :sunrise=>"2022-08-13T06:10:18.000-06:00",
        :sunset=>"2022-08-13T19:59:28.000-06:00",
        :max_temp=>95.04,
        :min_temp=>75,
        :conditions=>"clear sky",
        :icon=>"01d"}],
     :hourly_weather=>
      [{:time=>"2022-08-09T17:00:00.000-06:00", :temperature=>91.53, :conditions=>"scattered clouds", :icon=>"03d"},
       {:time=>"2022-08-09T18:00:00.000-06:00", :temperature=>91.62, :conditions=>"scattered clouds", :icon=>"03d"},
       {:time=>"2022-08-09T19:00:00.000-06:00", :temperature=>91.29, :conditions=>"scattered clouds", :icon=>"03d"},
       {:time=>"2022-08-09T20:00:00.000-06:00", :temperature=>88.99, :conditions=>"scattered clouds", :icon=>"03d"},
       {:time=>"2022-08-09T21:00:00.000-06:00", :temperature=>85.95, :conditions=>"scattered clouds", :icon=>"03n"},
       {:time=>"2022-08-09T22:00:00.000-06:00", :temperature=>82.65, :conditions=>"few clouds", :icon=>"02n"},
       {:time=>"2022-08-09T23:00:00.000-06:00", :temperature=>78.58, :conditions=>"few clouds", :icon=>"02n"},
       {:time=>"2022-08-10T00:00:00.000-06:00", :temperature=>77.27, :conditions=>"few clouds", :icon=>"02n"}]}}}
```
---

# USERS

**Create User**

- This endpoint creates a user and returns their api_key.

``` ruby
  [POST] /api/v1/users
  
  Required PARAMS: 
 - email, password, password_confirmation 
```

Example:

``` ruby 
[POST] /api/v1/users
```

- Body: 
```json
{
  "email": "bob@gmail.com",
  "password": "abc123",
  "password_confirmation": "abc123"
}
```

RESPONSE:

```json
{
    "data": {
        "type": "users",
        "id": 2,
        "attributes": {
            "email": "bob@gmail.com",
            "api_key": "Bv-8uwdqDc8s37wYRCTSrg"
        }
    }
}
```
---

# SESSIONS

**Create Session**

- This endpoint returns user information based on a successful log-in.

``` ruby
  [POST] /api/v1/sessions
  
  Required PARAMS: 
 - email, password
```

Example:

``` ruby 
[POST] /api/v1/users
```

- Body: 
```json
{
  "email": "bob@gmail.com",
  "password": "abc123"
}
```

RESPONSE:
```json
{
    "data": {
        "type": "users",
        "id": 2,
        "attributes": {
            "email": "bob@gmail.com",
            "api_key": "Bv-8uwdqDc8s37wYRCTSrg"
        }
    }
}
```
---

# ROADTRIP

**Create Road Trip**

- This endpoint creates a road trip between two locations.

``` ruby
  [POST] /api/v1/road_trip
  
  Required PARAMS: 
 - origin
 - destination
 -api_key
```

Example:

``` ruby 
[POST] /api/v1/road_trip
```

- Body: 
```json
{
  "origin": "Denver, CO",
  "destination": "Pueblo, CO",
  "api_key": "Bv-8uwdqDc8s37wYRCTSrg"
}
```

RESPONSE:
```json
{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "Denver, CO",
            "end_city": "Pueblo, CO",
            "travel_time": "01:45:23",
            "weather_at_eta": {
                "temperature": 79.54,
                "conditions": "clear sky"
            }
        }
    }
}
```
---

## Installation

1. Clone this directory to your local repository using the SSH key:

```

$ git clone git@github.com:StephenWilkens/sweater_weather.git

```

  

2. Install gems for development using [Bundler](https://bundler.io/guides/using_bundler_in_applications.html#getting-started---installing-bundler-and-bundle-init):

```

$ bundle install

```

  

3. Set up your database with:

```

$ rails db:{drop,create,migrate,seed}

```

  

4. Run the test suite with:

```

$ bundle exec rspec

```

  

5. Run your development server with:

```

$ rails s

```

  

6. In postman , make requests to ['localhost:3000/`](http://localhost:3000/) to see the app in action.
