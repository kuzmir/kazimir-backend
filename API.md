# KAZIMIR API v0.1

JSON Api for Kazimir is accessible under http://kazimirapp.pl/

## Streets.json

GET /streets.json

Returns the JSON with all the streets & places


```json
[
    {
        "id": 3,
        "name": "Miodowa",
        "path": {
            "type": "LineString",
            "coordinates": [
                [
                    50.05151770556981,
                    19.94217038154602
                ],
                [
                    50.05171059634681,
                    19.942599534988403
                ],
                [
                    50.05261303932572,
                    19.943983554840088
                ],
                [
                    50.053660127466614,
                    19.948371648788452
                ]
            ]
        },
        "path_string": "50.05151770556981,19.94217038154602;50.05171059634681,19.942599534988403;50.05261303932572,19.943983554840088;50.053660127466614,19.948371648788452;",
        "updated_at": "2015-05-07T21:27:21.000Z",
        "places": {
            "present": [
                {
                    "id": 5,
                    "details": {
                        "en": {
                            "name": "Tempel Synagogue",
                            "description": "The Tempel Synagogue (Polish: Synagoga Tempel) is a synagogue in Kraków, Poland, in the Kazimierz district. It is not only a major place of worship, but also a booming center of Jewish culture, which hosts numerous concerts and meetings, especially during the Festival.\r\n"
                        },
                        "pl": {
                            "name": "Synagoga Tempel",
                            "description": "Synagoga Tempel (Synagoga Postępowa) – reformowana synagoga znajdująca się na Kazimierzu w Krakowie, przy ulicy Miodowej 24. Jest obecnie jedną z czterech czynnych synagog w mieście, jednak nabożeństwa odbywają się w niej wyłącznie od czasu do czasu."
                        }
                    },
                    "updated_at": "2015-05-07T21:52:00.000Z",
                    "photos": [
                        {
                            "id": 6,
                            "details": {
                                "en": {
                                    "title": "Lorem",
                                    "description": ""
                                },
                                "pl": {
                                    "title": "Lorem",
                                    "description": ""
                                }
                            },
                            "images": {
                                "thumb": "http://kazimirapp.pl/system/photos/d03c24c2ec52d5838908336e2d0c96725d393514.jpg?1431036490",
                                "tiny": "http://kazimirapp.pl/system/photos/3f15e7905ef1843b5e9b426947e6e2aa21ce5589.jpg?1431036490",
                                "small": "http://kazimirapp.pl/system/photos/e671d8c186372f08d5313c22d8b3419f6785059d.jpg?1431036490",
                                "medium": "http://kazimirapp.pl/system/photos/0e20a840b2cd7772a597247397671b41bca44c75.jpg?1431036490",
                                "large": "http://kazimirapp.pl/system/photos/c0e3c588a1fb3994a4d1b674db0f9a1c4d1e642d.jpg?1431036490"
                            },
                            "updated_at": "2015-05-07T22:08:16.000Z"
                        }
                    ]
                }
            ],
            "past": [
                {
                    "id": 6,
                    "details": {
                        "en": {
                            "name": "Some place in the past",
                            "description": ""
                        },
                        "pl": {
                            "name": "Historyczne miejsce",
                            "description": ""
                        }
                    },
                    "update_at": "2015-05-07T21:56:21.000Z",
                    "photos": []
                }
            ]
        }
    }
]```
