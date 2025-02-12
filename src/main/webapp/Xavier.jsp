<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <title>Responsive Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 100%;
            max-width: 1660px;
            height: 100%;
            max-height: 1024px;
            display: flex;
            flex-direction: column;
            align-items: center;
            background: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        .header {
            width: 100%;
            height: 80px;
            background: #007bff;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 20px;
            color: white;
            flex-direction: column;
        }
        .navi {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
        }
        .navi ul {
            list-style: none;
            display: flex;
            gap: 20px;
        }
        .navi ul li {
            padding: 10px 15px;
            background: white;
            color: #007bff;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }
        .navi ul li:hover {
            background: #0056b3;
            color: white;
        }
        .logbox {
            display: none;
            width: 100%;
            background: rgba(255, 255, 255, 0.8);
            text-align: center;
            padding: 10px;
            font-weight: bold;
            color: #007bff;
        }
        .body {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-grow: 1;
            padding: 20px;
        }
        .loginbox {
            width: 350px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .loginbox input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .loginbox button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .loginbox button:hover {
            background-color: #0056b3;
        }
        .login-links {
            margin-top: 10px;
            font-size: 14px;
        }
        .login-links a {
            display: block;
            text-decoration: none;
            color: #007bff;
            margin: 5px 0;
        }
        .login-links a:hover {
            text-decoration: underline;
        }
        .social-login {
            margin-top: 15px;
        }
        .social-login button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            margin-top: 5px;
            cursor: pointer;
        }
        .kakao { background-color: #fee500; color: black; }

        /* 반응형 디자인 */
        @media (max-width: 1024px) {
            .container {
                width: 95%;
            }
            .loginbox {
                width: 300px;
            }
        }

        @media (max-width: 768px) {
            .body {
                flex-direction: column;
            }
            .loginbox {
                width: 100%;
                max-width: 350px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- 헤더 -->
        <div class="header">
            <div class="navi">
                <ul>
                    <li>Home</li>
                    <li>Game</li>
                    <li>Board</li>
                    <li>Service</li>
                </ul>
            </div>
            <div class="logbox">Welcome, User!</div>
        </div>

        <!-- 본문 -->
        <div class="body">
            <div class="contents">
                <div class="buttonlist">Button List</div>
                <div class="gameList">Game List</div>
                <div class="boardlist">Board List</div>
            </div>

            <!-- 로그인 박스 -->
            <div class="loginbox">
                <h2>로그인</h2>
                <input type="text" id="userId" placeholder="아이디">
                <input type="password" id="userPw" placeholder="비밀번호">
                <button id="loginBtn">로그인</button>

                <div class="login-links">
                    <a href="#">회원가입</a>
                    <a href="#">ID/PW 찾기</a>
                </div>

                <div class="social-login">
                    <button class="kakao">🟡 Kakao 로그인</button>
                </div>
            </div>
        </div>

        <!-- 푸터 -->
        <div class="footer">
            2025 Team CodeQuest CopyRight
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $("#loginBtn").click(function () {
                var userId = $("#userId").val();
                var userPw = $("#userPw").val();

                if (userId === "test" && userPw === "1234") {
                    alert("로그인 성공!");
                    $(".logbox").fadeIn();  // 로그인 후 logbox 보이기
                    $(".loginbox").fadeOut();  // 로그인 박스 숨기기
                } else {
                    alert("로그인 실패! 아이디 또는 비밀번호를 확인하세요.");
                }
            });
        });
    </script>
</body>
</html>
