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
})