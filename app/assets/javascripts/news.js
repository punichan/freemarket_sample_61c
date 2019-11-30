$(function(){
  $(".header__contents__right__todo__box").mouseover(function(){
    html =`
    <div class="header__contents__right__todo__box__k">
<i class="k-img">
<img width="55" height="55" src="https://static.mercdn.net/images/mercari_profile.png">
</i>
<i class="k-text">
ご登録のメールアドレスに認証メールを送りました。
</i>
</div>
    `
    $(".header__contents__right__todo__box").append(html)
  })
  $(".header__contents__right__todo__box").mouseleave(function(){
    $(".header__contents__right__todo__box__k").remove()
  })


  $(".header__contents__right__notice__box").mouseover(function(){
    html = `
    <div class="header__contents__right__notice__box__news">
<i class="news-img">
<img width="55" height="55" src="https://static.mercdn.net/images/mercari_profile.png">
<i class="news-text">
  事務局から個別メッセージ
</i>
</i>
</div>
    `
    $(".header__contents__right__notice__box").append(html)
  })
  $(".header__contents__right__notice__box").mouseleave(function(){
    $(".header__contents__right__notice__box__news").remove()
  })

//   $(".header__contents__right__ava__box__mypage").mouseover(function(){
//   html=`
//   <div class="header__contents__right__ava__box__mypage__top">
// <img width="60" height="60" class="mypage-img" src="https://static.mercdn.net/images/member_photo_noimage_thumb.png">
// </div>
// <ul class="list-mypage-tab">
// <i class="name">test</i>
// 評価：０ 出品数：２
// <li class="list-tab-p1">売上金</li>
// <li class="list-tab-p2">ポイント</li>
// <li class="list-tab">いいね！一覧</li>
// <li class="list-tab">出品した商品-出品中</li>
// <li class="list-tab">出品した商品-取引中</li>
// <li class="list-tab">出品した商品-売却済み</li>
// <li class="list-tab">購入した商品-取引中</li>
// <li class="list-tab">購入した商品-過去の取引</li>
// </ul>
// </div>
//   `
//   $(".header__contents__right__ava__box__mypage").append(html) 
// })
})
