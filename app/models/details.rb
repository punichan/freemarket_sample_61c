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

class ClothesSize < ActiveHash::Base
  self.data = [
    {id: 1, name: 'XXS以下'}, {id: 2, name: 'XS(SS)'}, {id: 3, name: 'S'},
      {id: 4, name: 'M'}, {id: 5, name: 'L'}, {id: 6, name: 'XL(LL)'},
      {id: 7, name: '2XL(3L)'}, {id: 8, name: '3XL(4L)'}, {id: 9, name: '4XL(5L)以上'},
      {id: 10, name: 'FREE SIZE'}
  ]
end

class Condition < ActiveHash::Base
  self.data = [
    {id: 1, name: '新品、未使用'}, {id: 2, name: '未使用に近い'}, {id: 3, name: '目立った傷や汚れなし'},
      {id: 4, name: 'やや傷や汚れあり'}, {id: 5, name: '傷や汚れあり'}, {id: 6, name: '全体的に状態が悪い'}
  ]
end