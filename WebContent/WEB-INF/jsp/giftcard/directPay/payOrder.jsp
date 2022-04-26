<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="suf" uri="/WEB-INF/tlds/StringUtil_fn.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
  <title>����Ʈ��� ��ǰ�� ���� ���� �ȳ�</title>


  <!-- Faivicon -->
  <link rel="icon" type="image/png" href="/images/directPay/favicon.ico">

  <!-- CSS -->
  <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
  <link rel="stylesheet" href="/lib/css/reset.css">
  <link rel="stylesheet" href="/lib/css/common_dc.css">
  <link rel="stylesheet" href="/lib/css/style.css">

  <!-- jQuery-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

</head>

<body>
  <header>
    <h1>
      <img src="/images/directPay/logo.svg" alt="����Ʈ���">
    </h1>
  </header>

  <div class="container">
    <div class="inner">
      <h2 class="main_tit" style="margin-bottom: 5rem;">��ǰ�� ���� ���� �ȳ�</h2>

      <h5 class="title">���� ���� <span>���� ���� ���� ���� �����Դϴ�.</span></h5>
      <ul class="history_wrap">
        <li class="history_list">
          <ul>
            <li>���� ��ǰ</li>
            <li>����Ʈ��� ����� ��ǰ��</li>
          </ul>
        </li>
        <li class="history_list">
          <ul>
            <li>�ֹ� ��ȣ</li>
            <li>${resultInfo.orderno }</li>
          </ul>
        </li>
        <li class="history_list">
          <ul>
            <li>���� ����</li>
            <li>${resultInfo.paydate }</li>
          </ul>
        </li>
        <li class="history_list">
          <ul>
            <li>���� �Ѿ�</li>
            <li><strong>${suf:getThousand(params.amt) }����</strong></li>
          </ul>
        </li>
        <li class="history_list">
          <ul>
            <li>������ (�Ա��ڸ�)</li>
            <li>${params.receiver}</li>
          </ul>
        </li>
        <li class="history_list">
          <ul>
            <li>�����������</li>
            <li>${resultInfo.vir_banknm } / ${resultInfo.vir_acctno } / ${resultInfo.receiver}</li>
          </ul>
        </li>
      </ul>

      <article class="mi_box">
        <p>
          �� ����Ʈ����� ����� ��ǰ���� ���� ����(PG) ��ü�� �Ƿ��Ͽ� �Ǹ��ϰ� �ֽ��ϴ�.<br>
          �� ���Ŵ� ������� ���� ����Ǹ� ���� ����翡 ���� �Ա�ó Ȯ���� ����� ������°� �ȳ��� �� �ֽ��ϴ�.<br>
          ������ ���� �Ա� ���´� �׻� �� ȭ�鿡�� Ȯ���Ͻ� �� �ֽ��ϴ�.
        </p>
      </article>

      <h5 class="title">ó�� ��Ȳ</h5>
      <ul class="history_wrap">
        <li class="history_list">
          <ul>
            <li>�ֹ� ��ȣ</li>
            <li>${resultInfo.orderno }</li>
          </ul>
        </li>
        <li class="history_list">
          <ul>
            <li>���� ��û<br>(�ֹ���ȣ:${resultInfo.orderno })</li>
            <li>${resultInfo.paydate }</li>
          </ul>
        </li>
        <li class="history_list">
          <ul>
            <li>����</li>
            <li>�ֹ� ����</li>
          </ul>
        </li>
        <li class="history_list">
          <ul>
            <li>�Ա� ����</li>
            <li>���</li>
          </ul>
        </li>
      </ul>

      <article class="btn_wrap">
        <button  type="button" onclick="window.close()" >�ݱ�</button>
        <button class="gray"  type="button" onclick="window.close()" >Ȯ��</button>
      </article>
    </div>
  </div>
</body>

</html>