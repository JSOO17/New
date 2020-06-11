INSERT INTO News (Author, Title, Description, Url, UrlToImage, PublishedAt, Content, CityId) VALUES
('Nathaniel Whittemore',
'A Vision for Digital Property Rights, Feat. Nic Carter',
'Most people today look at social platforms like any other private company, but what if we saw them as alternative jurisdictions with a new set of property rights?',
'"https://www.coindesk.com/a-vision-for-digital-property-rights-feat-nic-carter',
'"https://static.coindesk.com/wp-content/uploads/2020/06/Breakdown-6.10.jpg',
'2020-06-10T19:00:00Z',
'Most people today look at social platforms like any other private company, but what if we saw them as alternative jurisdictions with a new set of property rights?\r\nFor more episodes and free early ac',
4)

INSERT INTO CurrentWeather (ObservationTime, Temperature, WeatherDescription, WindSpeed, WindDegree, windDir, Pressure, Precip, HumidiTy, CloudOver, Feelslike, Visibility, CityId) VALUES
('2020-06-10T19:00:00Z',
20,
'Sunny',
20,
1010,
'S', 1000, 200, 80,
9,
10,
30,
5
)

SELECT *  FROM History

CREATE TABLE History (
NameCity VARCHAR(100),
SearchedAt DATETIME
)