<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Вход — Зоопарк "Зелёный Мир"</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2e8b57;
            --secondary-color: #f8f9fa;
            --accent-color: #ffc107;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 15px 0;
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
        }

        .login-container {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 20px;
        }

        .login-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.1);
            padding: 40px;
            width: 100%;
            max-width: 450px;
            border: none;
        }

        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .login-icon {
            font-size: 3rem;
            color: var(--primary-color);
            margin-bottom: 15px;
        }

        .form-control {
            padding: 12px 15px;
            border-radius: 10px;
            border: 2px solid #e9ecef;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(46, 139, 87, 0.25);
        }

        .form-label {
            font-weight: 600;
            color: #495057;
            margin-bottom: 8px;
        }

        .btn-login {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            padding: 12px;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.3s ease;
            width: 100%;
        }

        .btn-login:hover {
            background-color: #267349;
            border-color: #267349;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .password-toggle {
            position: relative;
        }

        .password-toggle-icon {
            position: absolute;
            right: 15px;
            top: 40%;
            transform: translateY(30%);
            cursor: pointer;
            color: #6c757d;
        }

        .register-link {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .register-link:hover {
            color: #267349;
            text-decoration: underline;
        }

        footer {
            background-color: #343a40;
            color: white;
            padding: 40px 0 20px;
            margin-top: auto;
        }

        .social-icons {
            font-size: 1.5rem;
            margin-bottom: 20px;
        }

        .social-icons a {
            color: white;
            margin: 0 10px;
            transition: color 0.3s ease;
        }

        .social-icons a:hover {
            color: var(--accent-color);
        }

        .alert-danger {
            border-radius: 10px;
            border: none;
            background-color: #f8d7da;
            color: #721c24;
            padding: 12px 15px;
        }

        @media (max-width: 576px) {
            .login-card {
                padding: 30px 25px;
                margin: 20px;
            }

            .login-icon {
                font-size: 2.5rem;
            }
        }
    </style>
</head>
<body>
<!-- Навигационная панель -->
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <div class="container">
        <a class="navbar-brand" href="/">
            <i class="fas fa-leaf me-2"></i>Зоопарк "Зелёный Мир"
        </a>
    </div>
</nav>

<!-- Основной контент -->
<div class="login-container">
    <div class="login-card" data-aos="zoom-in">
        <div class="login-header">
            <div class="login-icon">
                <i class="fas fa-user-circle"></i>
            </div>
            <h2>Вход в аккаунт</h2>
            <p class="text-muted">Введите ваши данные для входа</p>
        </div>

        <#if error??>
            <div class="alert alert-danger mb-4" role="alert">
                <i class="fas fa-exclamation-circle me-2"></i>${error}
            </div>
        </#if>

        <form method="post" action="/login">
            <div class="mb-4">
                <label for="username" class="form-label">Электронная почта</label>
                <input type="email" class="form-control" id="username" name="username"
                       value="${email!}" placeholder="Ваш email" required>
                <div class="form-text">Мы никогда не передадим вашу почту третьим лицам.</div>
            </div>

            <div class="mb-4 password-toggle">
                <label for="password" class="form-label">Пароль</label>
                <input type="password" class="form-control" id="password" name="password"
                       placeholder="Ваш пароль" required>
                <span class="password-toggle-icon" onclick="togglePassword()">
                        <i class="fas fa-eye"></i>
                    </span>
            </div>


            <button type="submit" class="btn btn-login btn-lg mb-4">
                <i class="fas fa-sign-in-alt me-2"></i>Войти
            </button>

            <div class="text-center">
                <p class="mb-0">
                    Нет аккаунта? <a href="/register" class="register-link">Зарегистрироваться</a>
                </p>
            </div>
        </form>
    </div>
</div>

<!-- Футер -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-4 mb-4">
                <h4>Зоопарк "Зелёный Мир"</h4>
                <p>Дом для более чем 150 видов животных со всего мира. Мы заботимся о сохранении природы и дарим людям возможность познакомиться с удивительным миром дикой природы.</p>
            </div>
            <div class="col-lg-4 mb-4">
                <h4>Контакты</h4>
                <p><i class="fas fa-phone me-2"></i>+375 (29) 123-45-67</p>
                <p><i class="fas fa-envelope me-2"></i>GreenWorld@zoo.by</p>
                <p><i class="fas fa-map-marker-alt me-2"></i>Минск, ул. Природная, 15</p>
            </div>
            <div class="col-lg-4 mb-4">
                <h4>Часы работы</h4>
                <p>Пн-Пт: 9:00 - 18:00</p>
                <p>Сб-Вс: 9:00 - 20:00</p>
                <p>Кассы закрываются за час до окончания</p>
            </div>
        </div>
        <div class="text-center social-icons">
            <a href="#"><i class="fab fa-facebook"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-youtube"></i></a>
        </div>
        <hr class="mt-4 bg-light">
        <div class="text-center">
            <p>© 2025 Зоопарк "Зелёный Мир". Все права защищены.</p>
            <p><a href="/feedback" class="text-white">Обратная связь</a> | <a href="#" class="text-white">Политика конфиденциальности</a></p>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
    // Инициализация AOS
    document.addEventListener('DOMContentLoaded', function() {
        AOS.init({
            duration: 1000,
            once: true,
            easing: 'ease-in-out'
        });
    });

    // Функция для переключения видимости пароля
    function togglePassword() {
        const passwordInput = document.getElementById('password');
        const eyeIcon = document.querySelector('.password-toggle-icon i');

        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            eyeIcon.classList.remove('fa-eye');
            eyeIcon.classList.add('fa-eye-slash');
        } else {
            passwordInput.type = 'password';
            eyeIcon.classList.remove('fa-eye-slash');
            eyeIcon.classList.add('fa-eye');
        }
    }

    // Автоматическое скрытие алерта через 5 секунд
    <#if error??>
    setTimeout(() => {
        const alert = document.querySelector('.alert');
        if (alert) {
            alert.style.transition = 'opacity 0.5s ease';
            alert.style.opacity = '0';
            setTimeout(() => alert.remove(), 500);
        }
    }, 5000);
    </#if>
</script>
</body>
</html>