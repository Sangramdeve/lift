const String jsonData = '''
  [
    {
      "Time": "08:30 AM",
      "Date": "2024-11-01",
      "PickupLocation": "123 Main St, Cityville",
      "PickupLatLng": {
          "latitude": 37.7749,
          "longitude": -122.4194
      },
      "Destination": "456 Elm St, Cityville",
      "DestinationLatLng": {
          "latitude": 37.7849,
          "longitude": -122.4094
      },
      "Fare": "15.00",
      "HasVehicle": true,
      "Recurring": ["Monday", "Wednesday", "Friday"],
      "Poly-lines": [
          "abc123xyz456",
          "def789ghi012"
      ]
    },
  ]
  ''';

const String placeJsonData = '''
 [
  {
   
    "location": "Mecheda, West Bengal, India",
    "coordinates": {
      "latitude": 22.410162,
      "longitude": 87.8631425
    }
  },
  {
   
    "location": "Mahishadal, West Bengal, India",
    "coordinates": {
      "latitude": 22.1813597,
      "longitude": 87.9898205
    }
  },
  {
   
    "location": "Airport, Dum Dum, West Bengal, India",
    "coordinates": {
      "latitude": 22.6418276,
      "longitude": 88.4296353
    }
  },
  {
    "location": "Dharmatala, Taltala, Kolkata, West Bengal, India",
    "coordinates": {
      "latitude": 22.5600686,
      "longitude": 88.3524678
    }
  },
  {
  
    "location": "Bagnan, West Bengal, India",
    "coordinates": {
      "latitude": 22.4683006,
      "longitude": 87.9707475
    }
  },
  {
   
    "location": "Haldia, West Bengal, India",
    "coordinates": {
      "latitude": 22.0627164,
      "longitude": 88.0832934
    }
  }
]

  ''';

const String testData = '''
 {
	"info": {
		"_postman_id": "722d8076-bd23-4067-ba04-400ea57dec83",
		"name": "Tasks",
		"schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json",
		"_exporter_id": "21844301"
	},
	"item": [
		{
			"name": "Registration",
			"request": {
				"method": "POST",
				"header": [
					{
						"key": "Content-Type",
						"value": "application/json",
						"type": "text"
					},
					{
						"key": "",
						"value": "",
						"type": "text",
						"disabled": true
					}
				],
				"body": {
					"mode": "formdata",
					"formdata": [
						{
							"key": "name",
							"value": "Test",
							"description": "Required",
							"type": "text"
						},
						{
							"key": "email",
							"value": "test@gmail.com",
							"description": "Required",
							"type": "text"
						},
						{
							"key": "mobile",
							"value": "9876543210",
							"description": "Required",
							"type": "text"
						},
						{
							"key": "image",
							"description": "Required",
							"type": "file",
							"src": "/C:/xampp/htdocs/sensea_merine_with_common_auth/public/faculty/study_material/6493051b2e4dabird.jpg"
						},
						{
							"key": "password",
							"value": "12345",
							"description": "Required",
							"type": "text"
						},
						{
							"key": "comf_password",
							"value": "12345",
							"description": "Required",
							"type": "text"
						}
					]
				},
				"url": {
					"raw": "https://ncubeoffice.com/api/Registration",
					"protocol": "https",
					"host": [
						"ncubeoffice",
						"com"
					],
					"path": [
						"api",
						"Registration"
					]
				}
			},
			"response": []
		},
		{
			"name": "Login",
			"request": {
				"method": "POST",
				"header": [
					{
						"key": "Content-Type",
						"value": "application/json",
						"type": "text"
					}
				],
				"body": {
					"mode": "formdata",
					"formdata": [
						{
							"key": "user_name",
							"value": "test@gmail.com",
							"description": "Required(email id)",
							"type": "text"
						},
						{
							"key": "password",
							"value": "12345",
							"description": "Required",
							"type": "text"
						}
					]
				},
				"url": {
					"raw": "https://ncubeoffice.com/api/Login",
					"protocol": "https",
					"host": [
						"ncubeoffice",
						"com"
					],
					"path": [
						"api",
						"Login"
					]
				}
			},
			"response": []
		},
		{
			"name": "List",
			"request": {
				"method": "GET",
				"header": [
					{
						"key": "Content-Type",
						"value": "application/json",
						"type": "text"
					}
				],
				"url": {
					"raw": "https://ncubeoffice.com/api/List",
					"protocol": "https",
					"host": [
						"ncubeoffice",
						"com"
					],
					"path": [
						"api",
						"List"
					]
				}
			},
			"response": []
		}
	]
}
  ''';

const String mapStyle = '''
  [
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e7e7e7"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#c9c9c9"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  }
]''';
