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
  <meta name="description" content="����Ʈ��� ��ǰ�� ���� �ȳ� �Դϴ�." />
  <meta name="Keywords" content="����Ʈ���, ��ǰ��, ��ǰ�� ����, �¶��� ��ǰ��" />
  <title>����Ʈ���</title>


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
      <a href="/direct/payInfo.do"><img src="/images/directPay/logo.svg" alt="����Ʈ���"></a>
    </h1>
  </header>

  <div class="container">
    <div class="inner">
      <h2 class="main_tit">����Ʈ��� ��ǰ�� ���� �ȳ�</h2>
      <p class="main_dec">��𼭳� ����ϰ�, �����ϰ� �����ϼ���.</p>

      <section class="info_box">
        <h3>��ǰ�� ��� ���� ���� �ȳ�</h3>
        <p>
          ����Ʈ����� B2B(����� ����Ͻ�) ��ǰ���� ���� ������ �����ϴ� ���༺ ���� �� ��ǳ��� ���� ����� �ִ� �뵵�� ����� �� ������,<br>
          �Ʒ��� ���� ��ǰ�� ����� ���ѵ˴ϴ�.<br>
          ��¥��ǰ, �渶, ���, ���, ����, ���� �� �����屸(����ǰ), �����, ����, ���༺ ����, ��ȸ���� �ŷ����� �ʿ� ����(����), ����ȭ��, ���λ���Ʈ,<br>
          ������, ����, ����, �ֿϵ����о�, ��������, ���ﱸ�α���, ����, ����
        </p>
      </section>

      <article class="info_list_box">
        <ul>
          <li>
            <img src="/images/directPay/check_icon.png" />
            <span>
              <!-- ��ǰ���� �����Ϸ��� ���� 1ȸ<br>
              ȸ�������� �ʿ��մϴ�. -->
              ������·� ��ǰ���� �����Ϸ��� ��Ȯ��<br> ���� �Աݰ����� ������ �ʿ��մϴ�.
            </span>
          </li>
          <li>
            <img src="/images/directPay/check_icon.png" />
            <span>
              ���� �̿� ���̽� ����Ʈ�� ������ ����<br>
              (�̸�, �޴�����ȣ, �������� ��)�� �Է��Ͻñ� �ٶ��ϴ�.
            </span>
          </li>
          <li>
            <img src="/images/directPay/check_icon.png" />
            <span>
              ������ ������ ��ǰ�� �������� ������<br>
              �����ؾ߸� ���� ����ڰ�<br>
              �� ������ ��ġ��ų �� �ֽ��ϴ�.
            </span>
          </li>
        </ul>
      </article>

      <article class="tab_box">
        <ul class="tab_tit_wrap">
          <li class="tab_tit active" data-id="0">��ǰ����</li>
          <!-- <li class="tab_tit" data-id="1"><a href="/direct/paySignup.do">ȸ������</a></li> -->
        </ul>

        <section class="tab_content_wrap">
          <article class="tab_content bg active" data-id="0">
            <div class="img_wrap">
              <img src="/images/directPay/barcode_img.png" alt="����Ʈ��� ����Ʈ ��ǰ��">
            </div>
            <button class="price_btn" onclick="location.href='/direct/payEnter.do'">�����ϱ�</button>
          </article>

          <!-- <article class="tab_content" data-id="1">
            <h5 class="title">�ֱ� ���� ���� <span>�ִ� 10��</span></h5>
            <ul class="history_wrap">
              <li class="history_list">
                <ul>
                  <li>ó����Ȳ</li>
                  <li><span class="state">�Ϸ�</span></li>
                </ul>
              </li>
              <li class="history_list">
                <ul>
                  <li>���� ��û (No.59)</li>
                  <li>2022/04/12 ���� 1�� 20�� 11��</li>
                </ul>
              </li>
              <li class="history_list">
                <ul>
                  <li>�Ա� ���</li>
                  <li>2022/04/12 ���� 1�� 20�� 11��</li>
                </ul>
              </li>
              <li class="history_list">
                <ul>
                  <li>��� ���</li>
                  <li>2022/04/12 ���� 1�� 20�� 11��</li>
                </ul>
              </li>
            </ul>

            <ul class="history_wrap">
              <li class="history_list">
                <ul>
                  <li>ó����Ȳ</li>
                  <li><span class="state gray">ó����</span></li>
                </ul>
              </li>
              <li class="history_list">
                <ul>
                  <li>���� ��û (No.59)</li>
                  <li>2022/04/12 ���� 1�� 20�� 11��</li>
                </ul>
              </li>
              <li class="history_list">
                <ul>
                  <li>�Ա� ���</li>
                  <li>2022/04/12 ���� 1�� 20�� 11��</li>
                </ul>
              </li>
              <li class="history_list">
                <ul>
                  <li>��� ���</li>
                  <li>2022/04/12 ���� 1�� 20�� 11��</li>
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