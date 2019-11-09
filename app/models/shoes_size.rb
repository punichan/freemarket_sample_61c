class ShoesSize < ActiveHash::Base
  self.data = [
    {id: 1, name: '23.5cm以下'}, {id: 2, name: '24cm'}, {id: 3, name: '24.5cm'},
    {id: 4, name: '25cm'}, {id: 5, name: '25.5cm'}, {id: 6, name: '26cm'},
    {id: 7, name: '26.5cm'}, {id: 8, name: '27cm'}, {id: 9, name: '27.5cm'},
    {id: 10, name: '28cm'},{id: 11, name: '28.5cm'},{id: 12, name: '29cm'},
    {id: 13, name: '29.5cm'},{id: 14, name: '30cm'},{id: 15, name: '30.5cm'},
    {id: 16, name: '31cm以上'}
  ]
end