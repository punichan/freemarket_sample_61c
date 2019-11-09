class DeliveryWay < ActiveHash::Base
  self.data = [
    {id: 1, name: '未定'}, {id: 2, name: 'らくらくメルカリ便'}, {id: 3, name: 'ゆうメール'},
      {id: 4, name: 'レターパック'}, {id: 5, name: '普通郵便(定形、定形外)'}, {id: 6, name: 'クロネコヤマト'},
      {id: 7, name: 'ゆうパック'}, {id: 8, name: 'クリックポスト'}, {id: 9, name: 'ゆうパケット'},
  ]
end

class DeliveryBurden < ActiveHash::Base
  self.data = [
    {id: 1, name: '送料込み(出品者負担)'}, {id: 2, name: '着払い(購入者負担)'}
  ]
end

class ShipmentDays < ActiveHash::Base
  self.data = [
    {id: 1, name: '1~2日で発送'}, {id: 2, name: '2~3日で発送'}, {id: 3, name: '4~7日で発送'}
  ]
end

