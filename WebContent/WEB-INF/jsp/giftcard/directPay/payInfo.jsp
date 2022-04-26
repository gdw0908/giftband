<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
  <meta name="format-detection" content="telephone=no" />
  <meta content="minimum-scale=1.0, width=device-width, maximum-scale=1, user-scalable=yes" name="viewport" />
  <meta name="author" content="31system" />
  <meta name="description" content="기프트밴드 상품권 구매 안내 입니다." />
  <meta name="Keywords" content="기프트밴드, 상품권, 상품권 구매, 온라인 상품권" />
  <title>기프트밴드</title>


  <!-- Faivicon -->
  <link rel="icon" type="image/png" href="/images/directPay/favicon.ico">

  <!-- CSS -->
  <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" type="text/css">
  <link rel="stylesheet" href="/lib/css/reset.css" type="text/css">
  <link rel="stylesheet" href="/lib/css/common_dc.css" type="text/css">
  <link rel="stylesheet" href="/lib/css/style.css" type="text/css">

  <!-- jQuery-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

</head>

<body>
  <header>
    <h1>
      <a href="/direct/payInfo.do"><img src="/images/directPay/logo.svg" alt="기프트밴드"></a>
    </h1>
  </header>

  <div class="container">
    <div class="inner">
      <h2 class="main_tit">기프트밴드 상품권 구매 안내</h2>
      <p class="main_dec">어디서나 사용하고, 간편하게 구매하세요.</p>

      <section class="info_box">
        <h3>상품권 사용 제한 유형 안내</h3>
        <p>
          기프트밴드의 B2B(기업간 비즈니스) 상품권은 시장 질서를 교란하는 사행성 조장 및 미풍양속 저해 우려가 있는 용도로 사용할 수 없으며,<br>
          아래와 같은 물품은 사용이 제한됩니다.<br>
          가짜명품, 경마, 경륜, 경매, 입찰, 군복 등 군용장구(군납품), 대출업, 복권, 사행성 게임, 사회통념상 거래제한 필요 업종(마약), 가상화폐, 성인사이트,<br>
          음란물, 순금, 순은, 애완동물분양, 정보제공, 유흥구인구직, 총포, 도검
        </p>
      </section>

      <article class="info_list_box">
        <ul>
          <li>
            <img src="/images/directPay/check_icon.png" />
            <span>
              <!-- 상품권을 구매하려면 최초 1회<br>
              회원가입이 필요합니다. -->
              가상계좌로 상품권을 구매하려면 정확한<br> 본인 입금계좌의 정보가 필요합니다.
            </span>
          </li>
          <li>
            <img src="/images/directPay/check_icon.png" />
            <span>
              현재 이용 중이신 사이트와 동일한 정보<br>
              (이름, 휴대폰번호, 계좌정보 등)로 입력하시기 바랍니다.
            </span>
          </li>
          <li>
            <img src="/images/directPay/check_icon.png" />
            <span>
              고객님의 정보와 상품권 구매자의 정보가<br>
              동일해야만 서비스 담당자가<br>
              두 정보를 일치시킬 수 있습니다.
            </span>
          </li>
        </ul>
      </article>

      <article class="tab_box">
        <ul class="tab_tit_wrap">
          <li class="tab_tit active" data-id="0">상품구매</li>
          <!-- <li class="tab_tit" data-id="1"><a href="/direct/paySignup.do">회원가입</a></li> -->
        </ul>

        <section class="tab_content_wrap">
          <article class="tab_content bg active" data-id="0">
            <div class="img_wrap">
              <img src="/images/directPay/barcode_img.png" alt="기프트밴드 포인트 상품권">
            </div>
            <button class="price_btn" onclick="location.href='/direct/payEnter.do'">결제하기</button>
          </article>

          <!-- <article class="tab_content" data-id="1">
            <h5 class="title">최근 구매 내역 <span>최대 10건</span></h5>
            <ul class="history_wrap">
              <li class="history_list">
                <ul>
                  <li>처리현황</li>
                  <li><span class="state">완료</span></li>
                </ul>
              </li>
              <li class="history_list">
                <ul>
                  <li>구매 신청 (No.59)</li>
                  <li>2022/04/12 오전 1시 20분 11초</li>
                </ul>
              </li>
              <li class="history_list">
                <ul>
                  <li>입금 대기</li>
                  <li>2022/04/12 오전 1시 20분 11초</li>
                </ul>
              </li>
              <li class="history_list">
                <ul>
                  <li>사용 대기</li>
                  <li>2022/04/12 오전 1시 20분 11초</li>
                </ul>
              </li>
            </ul>

            <ul class="history_wrap">
              <li class="history_list">
                <ul>
                  <li>처리현황</li>
                  <li><span class="state gray">처리중</span></li>
                </ul>
              </li>
              <li class="history_list">
                <ul>
                  <li>구매 신청 (No.59)</li>
                  <li>2022/04/12 오전 1시 20분 11초</li>
                </ul>
              </li>
              <li class="history_list">
                <ul>
                  <li>입금 대기</li>
                  <li>2022/04/12 오전 1시 20분 11초</li>
                </ul>
              </li>
              <li class="history_list">
                <ul>
                  <li>사용 대기</li>
                  <li>2022/04/12 오전 1시 20분 11초</li>
                </ul>
              </li>
            </ul>
          </article> -->
        </section>
      </article>
    </div>
  </div>
</body>

<script>
  let tabTile = document.querySelectorAll('.tab_tit');
  let tabContent = document.querySelectorAll('.tab_content');

  tabTile.forEach(tab => {
    tab.addEventListener('click', tabOpen);
  });

  function tabOpen(e) {
    tabContent.forEach(content => {
      if(content.dataset.id === e.target.dataset.id) {
        content.classList.add('active');
      } else {
        content.classList.remove('active');
      }
    });

    tabTile.forEach(tit => {
      if(tit.dataset.id === e.target.dataset.id) {
        tit.classList.add('active');
      } else {
        tit.classList.remove('active');
      }
    });
  }

</script>
</html>