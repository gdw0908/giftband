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
  <title>����Ʈ��� ȸ������</title>


  <!-- Faivicon -->
  <link rel="icon" type="image/png" href="/images/directPay/favicon.ico">

  <!-- CSS -->
  <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css?">
  <link rel="stylesheet" href="/lib/css/reset.css">
  <link rel="stylesheet" href="/lib/css/common_dc.css">
  <link rel="stylesheet" href="/lib/css/style.css">

  <!-- jQuery-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js?"></script>
  <script type="text/javascript" src="/lib/js/mc.js"></script>

</head>

<script type="text/javascript">
function join_form_chk() {
	if(jQuery("#ef_chk").is(":checked") == false)
	{
		alert("���� �̿��� ���� üũ�� ���ּ���.");
		$("#ef_chk").focus();
		return false;
	}else if(jQuery("#ps_chk").is(":checked") == false)
	{
		alert("�������� ���� �� �̿�ȳ� ���� üũ�� ���ּ���.");
		$("#ps_chk").focus();
		return false;
	}
	if (jQuery("#member_id").val() == ""
	       || jQuery("#member_id").val().length < 5) {
	    alert("���̵� �Է����� �ʾҰų� 5�ڸ� �̻� ����ؾ��մϴ�.");
	    $("#member_id").val("");
	    $("#member_id").focus();
	    return false;
	} else if (jQuery("#member_id_chk").val() == "") {
		alert("���̵� �ߺ�Ȯ���� �������ּ���.");
		return false;
	} else if (!CheckPassword(jQuery("#member_id").val(), jQuery(
    "#member_pw").val())) {
        alert("��й�ȣ�� 5~15���� �̳�\n���� ��/�ҹ���, ���ڸ� �����ؾ��մϴ�.");
        jQuery("#member_pw").val("");
        jQuery("#member_pw").focus();
        return false;
     }
}

function CheckPassword(uid, upw) {
    if (upw == "") {
       return false;
    }

    if (!/^[a-zA-Z0-9]{5,15}$/.test(upw)) {
       return false;
    }

    var chk_num = upw.search(/[0-9]/g);
    var chk_eng = upw.search(/[a-z]/ig);

    if (chk_num < 0 || chk_eng < 0) {
       return false;
    }

    if (/(\w)\1\1\1/.test(upw)) {
       return false;
    }

    /*if (upw.search(uid) > -1) {
       return false;
    }*/

    return true;
}

function chk_member_id() {
    if (jQuery("#member_id").val() == "") {
       alert("���̵� �Է��ϼ���.");
       jQuery("#member_id").val("");
       jQuery("#member_id").focus();
       return;
    } else {
       getJSON("/json/list/member.getMemberIdCheck.do", {
          "member_id" : jQuery("#member_id").val()
       }, function(data) {
          $("body").data("chk_member_id", data);
          var chk_member_id = $("body").data("chk_member_id");

          $.each(chk_member_id, function() {
             var data = this["member_id"];
          });

          if (data == "" || data == null) {
             //jQuery("#check_member_id").html("��� ������ ���̵� �Դϴ�.");
             alert("��� ������ ���̵� �Դϴ�.");
             jQuery("#member_id_chk").val("Y");
             return;
          } else {
             //jQuery("#check_member_id").html("�̹� ���� �Ǿ��ִ� ���̵� �Դϴ�.");
             alert("�̹� ���� �Ǿ��ִ� ���̵� �Դϴ�.")
             jQuery("#member_id").val("");
             jQuery("#member_id").focus();
             return;
          }

       });
    }

}

</script>

<body>
  <header>
    <h1>
      <img src="/images/directPay/logo.svg" alt="����Ʈ���">
    </h1>
  </header>

  <div class="container">
    <div class="inner">
      <h2 class="main_tit">ȸ������</h2>
      <section class="terms_container">
        <h5 class="title">��� ����</h5>
        <div class="terms_wrap">
          <article>
            <div class="box">
              <h6>��1�� (�������� ���� �̿�)</h6>
              <ol>
                <li>
                  1. �����ڴ� �����ǻ� ���� �Ǹ����� ��ǰ�� �����ϰų� ����ǥ�ø� �Ͽ����� �ƴ� �Ǹ�, �����ǻ� ���� ���������� ���Ͽ� ��ǰ�� ������ �ø��ų� �����ǻ縦 ǥ���Ͽ� �Ǹ����� ��ǰ�Ǹ��� ��ȸ�� �����ϰų� �ٸ� ��������
                  ���ű�ȸ�� ������ ���� ���ߵǴ� ��� ����Ʈ�����θ� ��ڴ� �ش� ���̵� ���Ͽ� ȸ���ڰ��� �����ϴ� ���� ��ġ�� ���� �� �ֽ��ϴ�.
                </li>
                <li>
                  2. �����ڴ� ��ǰ�� �����ϱ� ���� �ݵ�� �Ǹ��ڰ� ����Ʈ ���� �ۼ��� ��ǰ�� �� ����� �ŷ��� ������ ��Ȯ�ϰ� Ȯ���� �� ���Ÿ� �Ͽ��� �մϴ�. �����Ϸ��� ��ǰ�� ����� �ŷ��� ������ Ȯ������ �ʰ� �����Ͽ�
                  �߻��� ��� �ս�, ���ش� ������ ���ο��� �ֽ��ϴ�.
                </li>
                <li>
                  3. �����ڴ� �� ��� �� ����Ʈ�����θ� ��ڰ� ���� ȭ�鿡�� �����ϴ� ������ �ؼ��Ͽ��� �ϸ�, ��� �� ���������� �����ϰų� �������� �ƴ��Ͽ� �߻��ϴ� ��� �ս�, ���ؿ� ���Ͽ� å���� �δ��մϴ�.
                </li>
                <li>
                  4. ����Ʈ�����θ� ��ڴ� �Ǹ��ڰ� ��ǰ ����� ��ǰ�� ����� �ŷ����ǿ� ���ؼ� ��� �����̳� �븮�� ���� �ʽ��ϴ�. ���� �����ڴ� ��ǰ ���� �� �������� å�� �Ͽ� ��ǰ�� �����Ͽ��� �մϴ�.
                </li>
                <li>
                  5. �����ڴ� ������ ��ǰ�� û��öȸ�� ������ �߻��� ��� ������ ��ǰ�� ���Ƿ� ����ϰų� �Ѽյǵ��� ��ġ�Ͽ����� �� �˴ϴ�. û��öȸ ��ǰ�� ���ǻ���̳� ��ǰ������ �������� ���� ��ǰ�Ѽտ� ���Ͽ� �մ��� �����
                  �δ��Ͽ��� �մϴ�.
                </li>
                <li>
                  6. �����ڴ� �Ǹ��ڿ� ��ǰ�Ÿ� �������� ������ �߻��� ��� ������ �ذ��� ���Ͽ� ������ ���Ͽ��� �ϸ�, �����ذ��� �Ҽ��Ƿ� ���Ͽ� �Ǹ��ڿ� ����Ʈ�����θ� ��ڿ� �߻��� ��� �ս�, ���ظ� �δ��Ͽ��� �մϴ�.
                </li>
                <li>
                  7. �����ڴ� ��ǰ�� ���� �� ��������� ����Կ� �־� �ݵ�� ���� ������ ���������� ����Ͽ��� �ϸ�, Ÿ���� ���������� ���ǻ�� ���� �Ͽ����� �� �˴ϴ�. Ÿ���� ���������� ���� ��������ν� �߻��ϴ�
                  ����Ʈ�����θ� ���, �������� ������, �Ǹ����� �սǰ� ���ؿ� ���� ��� å���� �����ڿ��� �ֽ��ϴ�.
                </li>
                <li>
                  8. �ŸŴ���� ������ �����Ͽ� �����ڰ� �Է��� ���� �� �� ������ �����Ͽ� �߻��� å�Ӱ� �������� �������� �����ڰ� �δ��Ͽ��� �մϴ�.
                </li>
                <li>
                  9. ��ǰ�� �ֹ��� �� 7������(�����, ������ ����)�̳��� �ŸŴ���� �������� ���� ��� �ֹ���ҷ� ���ֵǸ�, �ش� �ֹ��� �ڵ� ��ҵ˴ϴ�.
                </li>
                <li>
                  10. ����Ʈ�����θ� ��ڴ� �����ڰ� �ŸŴ�� ���� �� ����� �������ܿ� ���� ������ �������� ������ �ִ����� ���θ� Ȯ���� �� ������, �̿� ���� Ȯ���� �Ϸ�� ������ �ŷ������� �����ϰų� �ش�ŷ��� �����
                  �� �ֽ��ϴ�.
                </li>
              </ol>
            </div>

            <p class="agreement agree_box">
              <span>���� �̿���</span>
              <label style="cursor: pointer;">
                <input type="checkbox" id="ef_chk" name="ef_chk" class="check">
                <span class="icon"></span> [�ʼ�] �����մϴ�.
              </label>
            </p>
          </article>

          <article>
            <div class="box">
              <h6>��1�� (�������� ���� �̿�)</h6>
              <ol>
                <li>
                  1. �����ڴ� �����ǻ� ���� �Ǹ����� ��ǰ�� �����ϰų� ����ǥ�ø� �Ͽ����� �ƴ� �Ǹ�, �����ǻ� ���� ���������� ���Ͽ� ��ǰ�� ������ �ø��ų� �����ǻ縦 ǥ���Ͽ� �Ǹ����� ��ǰ�Ǹ��� ��ȸ�� �����ϰų�
                  �ٸ� ��������
                  ���ű�ȸ�� ������ ���� ���ߵǴ� ��� ����Ʈ�����θ� ��ڴ� �ش� ���̵� ���Ͽ� ȸ���ڰ��� �����ϴ� ���� ��ġ�� ���� �� �ֽ��ϴ�.
                </li>
                <li>
                  2. �����ڴ� ��ǰ�� �����ϱ� ���� �ݵ�� �Ǹ��ڰ� ����Ʈ ���� �ۼ��� ��ǰ�� �� ����� �ŷ��� ������ ��Ȯ�ϰ� Ȯ���� �� ���Ÿ� �Ͽ��� �մϴ�. �����Ϸ��� ��ǰ�� ����� �ŷ��� ������ Ȯ������ �ʰ�
                  �����Ͽ�
                  �߻��� ��� �ս�, ���ش� ������ ���ο��� �ֽ��ϴ�.
                </li>
                <li>
                  3. �����ڴ� �� ��� �� ����Ʈ�����θ� ��ڰ� ���� ȭ�鿡�� �����ϴ� ������ �ؼ��Ͽ��� �ϸ�, ��� �� ���������� �����ϰų� �������� �ƴ��Ͽ� �߻��ϴ� ��� �ս�, ���ؿ� ���Ͽ� å����
                  �δ��մϴ�.
                </li>
                <li>
                  4. ����Ʈ�����θ� ��ڴ� �Ǹ��ڰ� ��ǰ ����� ��ǰ�� ����� �ŷ����ǿ� ���ؼ� ��� �����̳� �븮�� ���� �ʽ��ϴ�. ���� �����ڴ� ��ǰ ���� �� �������� å�� �Ͽ� ��ǰ�� �����Ͽ��� �մϴ�.
                </li>
                <li>
                  5. �����ڴ� ������ ��ǰ�� û��öȸ�� ������ �߻��� ��� ������ ��ǰ�� ���Ƿ� ����ϰų� �Ѽյǵ��� ��ġ�Ͽ����� �� �˴ϴ�. û��öȸ ��ǰ�� ���ǻ���̳� ��ǰ������ �������� ���� ��ǰ�Ѽտ� ���Ͽ�
                  �մ��� �����
                  �δ��Ͽ��� �մϴ�.
                </li>
                <li>
                  6. �����ڴ� �Ǹ��ڿ� ��ǰ�Ÿ� �������� ������ �߻��� ��� ������ �ذ��� ���Ͽ� ������ ���Ͽ��� �ϸ�, �����ذ��� �Ҽ��Ƿ� ���Ͽ� �Ǹ��ڿ� ����Ʈ�����θ� ��ڿ� �߻��� ��� �ս�, ���ظ�
                  �δ��Ͽ��� �մϴ�.
                </li>
                <li>
                  7. �����ڴ� ��ǰ�� ���� �� ��������� ����Կ� �־� �ݵ�� ���� ������ ���������� ����Ͽ��� �ϸ�, Ÿ���� ���������� ���ǻ�� ���� �Ͽ����� �� �˴ϴ�. Ÿ���� ���������� ���� ��������ν� �߻��ϴ�
                  ����Ʈ�����θ� ���, �������� ������, �Ǹ����� �սǰ� ���ؿ� ���� ��� å���� �����ڿ��� �ֽ��ϴ�.
                </li>
                <li>
                  8. �ŸŴ���� ������ �����Ͽ� �����ڰ� �Է��� ���� �� �� ������ �����Ͽ� �߻��� å�Ӱ� �������� �������� �����ڰ� �δ��Ͽ��� �մϴ�.
                </li>
                <li>
                  9. ��ǰ�� �ֹ��� �� 7������(�����, ������ ����)�̳��� �ŸŴ���� �������� ���� ��� �ֹ���ҷ� ���ֵǸ�, �ش� �ֹ��� �ڵ� ��ҵ˴ϴ�.
                </li>
                <li>
                  10. ����Ʈ�����θ� ��ڴ� �����ڰ� �ŸŴ�� ���� �� ����� �������ܿ� ���� ������ �������� ������ �ִ����� ���θ� Ȯ���� �� ������, �̿� ���� Ȯ���� �Ϸ�� ������ �ŷ������� �����ϰų�
                  �ش�ŷ��� �����
                  �� �ֽ��ϴ�.
                </li>
              </ol>
            </div>
                          
            <p class="agreement agree_box">
              <span>�������� ���� �� �̿�ȳ�</span>
              <label style="cursor: pointer;">
                <input type="checkbox" id="ps_chk" name="ps_chk" class="check">
                <span class="icon"></span> [�ʼ�] �����մϴ�.
              </label>
            </p>
          </article>
        </div>
      </section>

      <section>
        <h5 class="title">�����Է�</h5>
        <form class="join_form" method="post" name="join_form" id="join_form"
               action="/giftband/paySignupProc.do" onsubmit="return join_form_chk();">
          <ul class="join_wrap">
            <li class="join_list">
              <ul>
                <li>���̵�</li>
                <li>
	                <input type="text" id="member_id" name="member_id" class="join_input" placeholder=" 5 ~15���� ������ ���ڸ� ��� �����մϴ�.">&nbsp;
	                <button type="button" onclick="chk_member_id();" class="overlap_btn" style="color: #fff;">�ߺ�Ȯ��</button>
	                <input  type="hidden" name="member_id_chk" id="member_id_chk" value="" />
				</li>
              </ul>
            </li>
            <li class="join_list">
              <ul>
                <li>��й�ȣ</li>
                <li><input type="text" class="join_input" id="member_pw" name="member_pw" placeholder="��й�ȣ�� �Է����ּ���."></li>
              </ul>
            </li>
            <li class="join_list">
              <ul>
                <li>��й�ȣȮ��</li>
                <li><input type="text" class="join_input" id="member_pw_chk" name="member_pw_chk" placeholder="��й�ȣ�� �ٽ��ѹ� �Է��� �ּ���."></li>
              </ul>
            </li>
            <li class="join_list">
              <ul>
                <li>�̸�</li>
                <li><input type="text" class="join_input" id="member_nm" name="member_nm" placeholder="������ �Է����ּ���."></li>
              </ul>
            </li>
            <li class="join_list">
              <ul>
                <li>�޴�����ȣ</li>
                <li><input type="tel" class="join_input" id="cell" name="cell" placeholder="�޴��� ��ȣ�� ���ڸ� �Է����ּ���."></li>
              </ul>
            </li>
          </ul>
          <button type="submit" class="main_btn" style="margin: auto;">�����ϱ�</button>
        </form>
      </section>

    </div>
  </div>
</body>

</html>