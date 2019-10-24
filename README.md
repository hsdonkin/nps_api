# National Parks Service Dataset API

_Using a NPS GeoJSON dataset_

## Description
Rails API created from a points of interest dataset by National Parks Service

## Setup / Installation
* Install Ruby & Rails
* Launch API on localhost:3000 with command 'rails server'
* Send GET requests to localhost:3000 via Postman or your favorite API test client

## Available Endpoints
* '/' => An index of all 11,000 entries in dataset
* '/types' => A list of suggested queries based on type
* '/types/:type' => View all features that correspond to the type entered
*  '/campgrounds' => All campgrounds from the dataset
*  '/ranger_stations' => All ranger stations from the dataset
*  '/fishing' => All fishing sites from the dataset
*  '/cave_entrances' => All cave entrances from the dataset
*  '/lodges' => All lodges from dataset
*  '/random' => A random site

## Notable Functionality
*  All database scopes are generated dynamically based on "feature_type" entries in dataset
* '/types' returns a custom JSON response with suggested routes to try

## Bugs
* Tags property is currently stored as a string, pending a solution to convert it to an object

### License
_open source_

_Copyright (c) 2019 **Hugh Donkin**_
