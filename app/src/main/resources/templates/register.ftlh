<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Регистрация — Зоопарк "Зелёный Мир"</title>
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

        .register-container {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 20px;
        }

        .register-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.1);
            padding: 40px;
            width: 100%;
            max-width: 500px;
            border: none;
        }

        .register-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .register-icon {
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

        .btn-register {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            padding: 12px;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.3s ease;
            width: 100%;
        }

        .btn-register:hover {
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
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #6c757d;
        }

        .login-link {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .login-link:hover {
            color: #267349;
            text-decoration: underline;
        }

        .password-strength {
            height: 5px;
            border-radius: 3px;
            margin-top: 5px;
            background: #e9ecef;
            overflow: hidden;
        }

        .password-strength-bar {
            height: 100%;
            width: 0%;
            transition: width 0.3s ease;
            border-radius: 3px;
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

        .terms-text {
            font-size: 0.9rem;
            color: #6c757d;
            text-align: center;
        }

        @media (max-width: 576px) {
            .register-card {
                padding: 30px 25px;
                margin: 20px;
            }

            .register-icon {
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
<div class="register-container">
    <div class="register-card" data-aos="zoom-in">
        <div class="register-header">
            <div class="register-icon">
                <i class="fas fa-user-plus"></i>
            </div>
            <h2>Создать аккаунт</h2>
            <p class="text-muted">Присоединяйтесь к нашему сообществу</p>
        </div>

        <#if error??>
            <div class="alert alert-danger mb-4" role="alert">
                <i class="fas fa-exclamation-circle me-2"></i>${error}
            </div>
        </#if>

        <form method="post" action="/register">
            <div class="mb-4">
                <label for="name" class="form-label">Имя</label>
                <input type="text" class="form-control" id="name" name="name"
                       placeholder="Ваше имя" required>
                <div class="form-text">Как мы можем к вам обращаться?</div>
            </div>

            <div class="mb-4">
                <label for="email" class="form-label">Электронная почта</label>
                <input type="email" class="form-control" id="email" name="email"
                       placeholder="your.email@example.com" required>
                <div class="form-text">Мы никогда не передадим вашу почту третьим лицам.</div>
            </div>

            <div class="mb-4 password-toggle">
                <label for="password" class="form-label">Пароль</label>
                <input type="password" class="form-control" id="password" name="password"
                       placeholder="Создайте надежный пароль" required
                       oninput="checkPasswordStrength()">
                <span class="password-toggle-icon" onclick="togglePassword()">
                        <i class="fas fa-eye"></i>
                    </span>
                <div class="password-strength mt-2">
                    <div class="password-strength-bar" id="passwordStrengthBar"></div>
                </div>
                <div class="form-text" id="passwordStrengthText">Надежность пароля</div>
            </div>

            <div class="mb-4 password-toggle">
                <label for="confirmPassword" class="form-label">Подтверждение пароля</label>
                <input type="password" class="form-control" id="confirmPassword"
                       placeholder="Повторите ваш пароль" required
                       oninput="checkPasswordMatch()">
                <span class="password-toggle-icon" onclick="toggleConfirmPassword()">
                        <i class="fas fa-eye"></i>
                    </span>
                <div class="form-text" id="passwordMatchText"></div>
            </div>

            <div class="mb-4 form-check">
                <input type="checkbox" class="form-check-input" id="terms" name="terms" required>
                <label class="form-check-label" for="terms">
                    Я принимаю <a href="#" class="login-link">условия использования</a> и
                    <a href="#" class="login-link">политику конфиденциальности</a>
                </label>
            </div>

            <button type="submit" class="btn btn-register btn-lg mb-4">
                <i class="fas fa-user-plus me-2"></i>Зарегистрироваться
            </button>

            <div class="text-center">
                <p class="mb-0">
                    Уже есть аккаунт? <a href="/login" class="login-link">Войти</a>
                </p>
            </div>

            <p class="terms-text mt-3">
                Регистрируясь, вы соглашаетесь с нашими условиями использования и политикой конфиденциальности.
            </p>
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
        const eyeIcon = document.querySelector('#password + .password-toggle-icon i');

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

    // Функция для переключения видимости подтверждения пароля
    function toggleConfirmPassword() {
        const confirmInput = document.getElementById('confirmPassword');
        const eyeIcon = document.querySelector('#confirmPassword + .password-toggle-icon i');

        if (confirmInput.type === 'password') {
            confirmInput.type = 'text';
            eyeIcon.classList.remove('fa-eye');
            eyeIcon.classList.add('fa-eye-slash');
        } else {
            confirmInput.type = 'password';
            eyeIcon.classList.remove('fa-eye-slash');
            eyeIcon.classList.add('fa-eye');
        }
    }

    // Проверка силы пароля
    function checkPasswordStrength() {
        const password = document.getElementById('password').value;
        const strengthBar = document.getElementById('passwordStrengthBar');
        const strengthText = document.getElementById('passwordStrengthText');

        let strength = 0;
        let color = '#dc3545';
        let text = 'Слабый пароль';

        if (password.length >= 8) strength += 1;
        if (password.match(/[a-zа-я]+/)) strength += 1;
        if (password.match(/[A-ZА-Я]+/)) strength += 1;
        if (password.match(/[0-9]+/)) strength += 1;
        if (password.match(/[!@#$%^&*(),.?":{}|<>]+/)) strength += 1;

        if (strength > 4) {
            color = '#28a745';
            text = 'Очень надежный пароль';
        } else if (strength > 3) {
            color = '#17a2b8';
            text = 'Хороший пароль';
        } else if (strength > 2) {
            color = '#ffc107';
            text = 'Средний пароль';
        }

        strengthBar.style.width = (strength * 20) + '%';
        strengthBar.style.background = color;
        strengthText.textContent = text;
        strengthText.style.color = color;
    }

    // Проверка совпадения паролей
    function checkPasswordMatch() {
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirmPassword').value;
        const matchText = document.getElementById('passwordMatchText');

        if (confirmPassword === '') {
            matchText.textContent = '';
        } else if (password === confirmPassword) {
            matchText.textContent = 'Пароли совпадают';
            matchText.style.color = '#28a745';
        } else {
            matchText.textContent = 'Пароли не совпадают';
            matchText.style.color = '#dc3545';
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