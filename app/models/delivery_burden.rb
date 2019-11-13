class DeliveryBurden < ActiveHash::Base
  self.data = [
    {id: 1, name: '送料込み(出品者負担)',name2: '送料込み'}, {id: 2, name: '着払い(購入者負担)',name2: '着払い'}
  ]
end