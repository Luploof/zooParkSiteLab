<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Животные зоопарка "Зелёный Мир"</title>
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

        .hero-section {
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('https://images.unsplash.com/photo-1550353127-b0da3aeaa0ca?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            padding: 120px 0 80px;
            color: white;
            text-align: center;
            margin-bottom: 40px;
        }

        .animal-card {
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            margin-bottom: 30px;
            border: none;
            background: white;
        }

        .animal-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(0,0,0,0.2);
        }

        .animal-img {
            height: 250px;
            object-fit: cover;
            width: 100%;
            transition: transform 0.5s ease;
        }

        .animal-card:hover .animal-img {
            transform: scale(1.05);
        }

        .animal-card .card-body {
            padding: 1.5rem;
        }

        .animal-card .card-title {
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 0.5rem;
            font-size: 1.25rem;
        }

        .view-details-btn {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            padding: 8px 20px;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .view-details-btn:hover {
            background-color: #267349;
            border-color: #267349;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        footer {
            background-color: #343a40;
            color: white;
            padding: 60px 0 30px;
            margin-top: 60px;
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

        .section-title {
            position: relative;
            margin-bottom: 40px;
            font-weight: 700;
            text-align: center;
        }

        .section-title:after {
            content: '';
            display: block;
            width: 80px;
            height: 4px;
            background: var(--primary-color);
            margin: 15px auto;
            border-radius: 2px;
        }

        @media (max-width: 768px) {
            .hero-section {
                padding: 100px 0 60px;
            }

            .animal-card {
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body>
<!-- Навигационная панель -->
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
            <#-- Если пользователь залогинен -->
            <#if userEmail??>
                <form method="post" action="/logout">
                    <a class="btn btn-outline-light" href="/login">Войти</a>
                </form>
            <#else>
                <button type="submit" class="btn btn-outline-light">Выйти</button>
            </#if>
        </div>

    </div>
</nav>

<!-- Герой секция -->
<section class="hero-section">
    <div class="container">
        <h1 class="display-4 fw-bold mb-4" data-aos="fade-up">Наши животные</h1>
        <p class="lead mb-0" data-aos="fade-up" data-aos-delay="200">Познакомьтесь с удивительными обитателями зоопарка</p>
    </div>
</section>

<!-- Сетка животных -->
<div class="container">
    <h2 class="section-title" data-aos="fade-up">Наши обитатели</h2>
    <div class="row g-4">
        <#list animals as animal>
            <div class="col-lg-3 col-md-4 col-sm-6" data-aos="fade-up" data-aos-delay="${animal?index * 100}">
                <div class="animal-card">
                    <div class="position-relative overflow-hidden">
                        <img src="${animal.photoUrl}" class="animal-img" alt="${animal.name}">
                        <div class="position-absolute top-0 end-0 m-2">
                        </div>
                    </div>
                    <div class="card-body text-center">
                        <h5 class="card-title">
                            ${animal.name}
                        </h5>
                        <a href="/animals/${animal.id}" class="btn view-details-btn">
                            <i class="fas fa-eye me-2"></i>Подробнее
                        </a>
                    </div>
                </div>
            </div>
        </#list>
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
    });
</script>
</body>
</html>