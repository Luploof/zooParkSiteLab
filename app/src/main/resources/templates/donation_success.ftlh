<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Спасибо за пожертвование - Зоопарк "Зелёный Мир"</title>
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
            overflow-x: hidden;
            background-color: #f8f9fa;
        }

        .navbar {
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 15px 0;
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
        }

        .thankyou-hero {
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url('https://images.unsplash.com/photo-1548199973-03cce0bbc87b?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            padding: 100px 0;
            color: white;
            text-align: center;
        }

        .thankyou-card {
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 15px 40px rgba(0,0,0,0.1);
            border: none;
            margin-top: -80px;
            background: white;
        }

        .thankyou-icon {
            font-size: 5rem;
            color: var(--primary-color);
            margin-bottom: 20px;
            animation: pulse 1.5s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }

        .amount-display {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--primary-color);
            margin: 20px 0;
        }

        .btn-success {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            padding: 12px 30px;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-success:hover {
            background-color: #267349;
            border-color: #267349;
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }

        .impact-section {
            padding: 80px 0;
            background-color: var(--secondary-color);
        }

        .impact-card {
            text-align: center;
            padding: 30px 20px;
            border-radius: 15px;
            background: white;
            box-shadow: 0 5px 20px rgba(0,0,0,0.05);
            transition: transform 0.3s ease;
            height: 100%;
        }

        .impact-card:hover {
            transform: translateY(-10px);
        }

        .impact-icon {
            font-size: 3rem;
            color: var(--primary-color);
            margin-bottom: 20px;
        }

        footer {
            background-color: #343a40;
            color: white;
            padding: 60px 0 30px;
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

        .confetti {
            position: absolute;
            width: 10px;
            height: 10px;
            background-color: var(--primary-color);
            opacity: 0.7;
            border-radius: 50%;
            animation: confetti-fall 5s linear infinite;
        }

        @keyframes confetti-fall {
            0% {
                transform: translateY(-100px) rotate(0deg);
                opacity: 1;
            }
            100% {
                transform: translateY(100vh) rotate(360deg);
                opacity: 0;
            }
        }

        @media (max-width: 768px) {
            .thankyou-hero {
                padding: 80px 0;
            }

            .thankyou-icon {
                font-size: 4rem;
            }

            .amount-display {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-success fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">
            <i class="fas fa-leaf me-2"></i>Зоопарк "Зелёный Мир"
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="/">Главная</a></li>
                <li class="nav-item"><a class="nav-link" href="/donation">Пожертвования</a></li>
                <li class="nav-item"><a class="nav-link" href="/animals">Животные</a></li>
                <li class="nav-item"><a class="nav-link" href="/tickets">Купить билет</a></li>
                <li class="nav-item"><a class="nav-link" href="/excursions">Экскурсии</a></li>
                <li class="nav-item"><a class="nav-link" href="/volunteers">Волонтерство</a></li>
            </ul>
        </div>
        <div class="d-flex">
            <#if userEmail??>
                <form method="post" action="/logout">
                    <button type="submit" class="btn btn-outline-light">Выйти</button>
                </form>
            <#else>
                <a class="btn btn-outline-light" href="/login">Войти</a>
            </#if>
        </div>

    </div>
</nav>

<section class="thankyou-hero" data-aos="fade-in">
    <div class="container">
        <h1 class="display-4 fw-bold mb-4">Ваша поддержка бесценна!</h1>
        <p class="lead">Спасибо за ваш вклад в сохранение природы и заботу о животных</p>
    </div>
</section>

<div class="container mb-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="thankyou-card" data-aos="zoom-in">
                <div class="card-body p-5 text-center">
                    <div class="thankyou-icon">
                        <i class="fas fa-heart"></i>
                    </div>
                    <h2 class="mb-4">Спасибо, ${donorName}! 🎉</h2>

                    <div class="amount-display">
                        ${amount}BYN
                    </div>

                    <p class="fs-5 mb-4">
                        Вы пожертвовали <b>${amount}BYN</b> зоопарку «Зелёный Мир».<br>
                        Ваша поддержка поможет обеспечить животных всем необходимым!
                    </p>

                    <div class="alert alert-success mt-4" role="alert">
                        <i class="fas fa-envelope me-2"></i>
                        Письмо с благодарностью уже отправлено на вашу почту
                    </div>

                    <div class="mt-5">
                        <a href="/" class="btn btn-success btn-lg me-3">
                            <i class="fas fa-home me-2"></i>На главную
                        </a>
                        <a href="/animals" class="btn btn-outline-success btn-lg">
                            <i class="fas fa-paw me-2"></i>Посмотреть животных
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<section class="impact-section">
    <div class="container">
        <h2 class="text-center mb-5" data-aos="fade-up">Как ваше пожертвование помогает животным</h2>
        <div class="row">
            <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="100">
                <div class="impact-card">
                    <div class="impact-icon">
                        <i class="fas fa-utensils"></i>
                    </div>
                    <h4>Питание животных</h4>
                    <p>Обеспечиваем сбалансированное питание для всех обитателей зоопарка</p>
                </div>
            </div>
            <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="200">
                <div class="impact-card">
                    <div class="impact-icon">
                        <i class="fas fa-first-aid"></i>
                    </div>
                    <h4>Ветеринарная помощь</h4>
                    <p>Обеспечиваем регулярные осмотры и необходимое лечение</p>
                </div>
            </div>
            <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="300">
                <div class="impact-card">
                    <div class="impact-icon">
                        <i class="fas fa-home"></i>
                    </div>
                    <h4>Улучшение вольеров</h4>
                    <p>Создаем комфортные условия, приближенные к естественной среде</p>
                </div>
            </div>
        </div>
    </div>
</section>

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
                <p>Кассы закрываются за час до окончания работы зоопарка</p>
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

        // Создание конфетти
        function createConfetti() {
            const colors = ['#2e8b57', '#ffc107', '#fd7e14', '#dc3545', '#6f42c1'];
            const container = document.querySelector('.thankyou-hero');

            for (let i = 0; i < 50; i++) {
                const confetti = document.createElement('div');
                confetti.className = 'confetti';
                confetti.style.left = Math.random() * 100 + 'vw';
                confetti.style.animationDelay = Math.random() * 5 + 's';
                confetti.style.background = colors[Math.floor(Math.random() * colors.length)];
                confetti.style.width = (Math.random() * 10 + 5) + 'px';
                confetti.style.height = confetti.style.width;
                container.appendChild(confetti);
            }
        }

        createConfetti();
    });
</script>
</body>
</html>