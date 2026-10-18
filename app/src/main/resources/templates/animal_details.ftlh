<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${animal.name} — Зоопарк "Зелёный Мир"</title>
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

        .animal-hero {
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url('https://images.unsplash.com/photo-1550353127-b0da3aeaa0ca?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            padding: 100px 0 60px;
            color: white;
            text-align: center;
            margin-bottom: 40px;
        }

        .animal-detail-card {
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 15px 40px rgba(0,0,0,0.1);
            margin-bottom: 50px;
            background: white;
            border: none;
        }

        .animal-image {
            height: 100%;
            object-fit: cover;
            width: 100%;
            border-radius: 20px 0 0 20px;
        }

        .animal-info {
            padding: 40px;
        }

        .animal-stats {
            display: flex;
            gap: 20px;
            margin: 25px 0;
            flex-wrap: wrap;
        }

        .stat-item {
            text-align: center;
            padding: 20px;
            background: var(--secondary-color);
            border-radius: 15px;
            flex: 1;
            min-width: 120px;
        }

        .stat-value {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 5px;
        }

        .stat-label {
            font-size: 0.9rem;
            color: #6c757d;
        }

        .btn-back {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            padding: 12px 30px;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-back:hover {
            background-color: #267349;
            border-color: #267349;
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }

        .description-box {
            background: var(--secondary-color);
            padding: 25px;
            border-radius: 15px;
            margin: 25px 0;
            border-left: 5px solid var(--primary-color);
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

        @media (max-width: 992px) {
            .animal-image {
                border-radius: 20px 20px 0 0;
                height: 400px;
            }

            .animal-info {
                padding: 30px;
            }

            .animal-stats {
                justify-content: center;
            }

            .stat-item {
                min-width: 100px;
            }
        }

        @media (max-width: 576px) {
            .animal-stats {
                flex-direction: column;
            }

            .stat-item {
                min-width: auto;
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
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="/">Главная</a></li>
                <li class="nav-item"><a class="nav-link" href="/donation">Пожертвования</a></li>
                <li class="nav-item"><a class="nav-link active" href="/animals">Животные</a></li>
                <li class="nav-item"><a class="nav-link" href="/tickets">Купить билет</a></li>
                <li class="nav-item"><a class="nav-link" href="/excursions">Экскурсии</a></li>
                <li class="nav-item"><a class="nav-link" href="/volunteers">Волонтерство</a></li>
            </ul>
        </div>
        <div class="d-flex">
            <#-- Если пользователь залогинен -->
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

<!-- Герой секция -->
<section class="animal-hero" data-aos="fade-in">
    <div class="container">
        <h1 class="display-4 fw-bold mb-4">${animal.name}</h1>
        <p class="lead">Узнайте больше об этом удивительном создании</p>
    </div>
</section>

<!-- Детали животного -->
<div class="container">
    <div class="animal-detail-card" data-aos="zoom-in">
        <div class="row g-0">
            <div class="col-lg-6">
                <img src="${animal.photoUrl}" class="animal-image" alt="${animal.name}">
            </div>
            <div class="col-lg-6">
                <div class="animal-info">
                    <h2 class="mb-4">${animal.name}</h2>

                    <div class="animal-stats">
                        <div class="stat-item">
                            <div class="stat-value">${animal.height}</div>
                            <div class="stat-label">см рост</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-value">${animal.weight}</div>
                            <div class="stat-label">кг вес</div>
                        </div>
                    </div>

                    <!-- Убрано отображение species, так как этого поля нет в модели -->

                    <div class="description-box">
                        <h5><i class="fas fa-info-circle me-2"></i>Описание</h5>
                        <p class="mb-0">${animal.description}</p>
                    </div>

                    <div class="d-flex gap-3 flex-wrap">
                        <a href="/animals" class="btn btn-back">
                            <i class="fas fa-arrow-left me-2"></i>Назад к животным
                        </a>
                        <a href="/donation" class="btn btn-outline-success">
                            <i class="fas fa-heart me-2"></i>Поддержать
                        </a>
                    </div>
                </div>
            </div>
        </div>
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