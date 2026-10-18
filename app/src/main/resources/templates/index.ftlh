<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Зоопарк "Зелёный Мир"</title>
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
        }

        .navbar {
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 15px 0;
            transition: all 0.3s ease;
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
        }

        .hero-section {
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('https://images.unsplash.com/photo-1593069567131-53a0614dde1d?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            align-items: center;
            color: white;
            margin-top: -76px;
            padding-top: 76px;
        }

        .hero-content {
            max-width: 800px;
            margin: 0 auto;
            text-align: center;
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

        .animal-card {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            margin-bottom: 30px;
            background: white;
        }

        .animal-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.15);
        }

        .animal-img {
            height: 250px;
            object-fit: cover;
            width: 100%;
        }

        .stats-section {
            background-color: var(--primary-color);
            color: white;
            padding: 80px 0;
        }

        .stat-item {
            text-align: center;
            padding: 20px;
        }

        .stat-number {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .volunteer-section {
            background-color: var(--secondary-color);
            padding: 80px 0;
        }

        .volunteer-card {
            border-left: 5px solid var(--accent-color);
            padding: 20px;
            margin-bottom: 30px;
            background: white;
            border-radius: 5px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }

        .map-container {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            margin: 40px 0;
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

        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            padding: 12px 30px;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #267349;
            border-color: #267349;
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }

        .fade-in {
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 0.8s ease, transform 0.8s ease;
        }

        .fade-in.visible {
            opacity: 1;
            transform: translateY(0);
        }

        .zoom-effect {
            transition: transform 0.5s ease;
        }

        .zoom-effect:hover {
            transform: scale(1.05);
        }

        @media (max-width: 768px) {
            .hero-section {
                height: 80vh;
            }

            .stat-number {
                font-size: 2rem;
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
                    <button type="submit" class="btn btn-outline-light">Выйти</button>
                </form>
            <#else>
                <a class="btn btn-outline-light" href="/login">Войти</a>
            </#if>
        </div>

    </div>
</nav>

<!-- Герой секция -->
<section class="hero-section" id="home" data-aos="fade-in">
    <div class="container hero-content">
        <h1 class="display-3 fw-bold mb-4">Добро пожаловать в Зоопарк "Зелёный Мир"</h1>
        <p class="lead mb-5">Откройте для себя удивительный мир дикой природы в самом сердце города. Более 150 видов животных, образовательные программы и природоохранные инициативы.</p>
        <a href="/tickets" class="btn btn-primary btn-lg">Купить билет</a>
    </div>
</section>

<!-- Статистика -->
<section class="stats-section" data-aos="fade-up">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-6">
                <div class="stat-item">
                    <div class="stat-number" data-count="150">0</div>
                    <div class="stat-title">Видов животных</div>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="stat-item">
                    <div class="stat-number" data-count="50000">0</div>
                    <div class="stat-title">Посетителей в год</div>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="stat-item">
                    <div class="stat-number" data-count="120">0</div>
                    <div class="stat-title">Волонтеров</div>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="stat-item">
                    <div class="stat-number" data-count="15">0</div>
                    <div class="stat-title">Лет работы</div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Животные -->
<section class="py-5" id="animals" style="padding: 100px 0;">
    <div class="container">
        <h2 class="section-title" data-aos="fade-up">Наши обитатели</h2>
        <div class="row">
            <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="100">
                <div class="animal-card">
                    <img src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQpYJRT5swsekg2XvbDzooLHUlcz81ZiMQWSM7diWGvLB0tH_lwAj5cuRPjLNxabBE4Fm3RWcBgLoIXM7qsx5ZZbZEn7IMfnfoAEeOKT6ri-w" alt="Амурский тигр" class="animal-img">
                    <div class="p-4">
                        <h3>Амурский тигр</h3>
                        <p>Крупнейший представитель кошачьих, находящийся под угрозой исчезновения. В нашем зоопарке созданы специальные условия, максимально приближенные к естественной среде обитания.</p>
                        <a href="#" class="btn btn-sm btn-outline-success">Узнать больше</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
                <div class="animal-card">
                    <img src="https://images.unsplash.com/photo-1564349683136-77e08dba1ef7?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Большая панда" class="animal-img">
                    <div class="p-4">
                        <h3>Большая панда</h3>
                        <p>Символ Всемирного фонда дикой природы. Наш зоопарк участвует в международной программе по сохранению и размножению этих удивительных животных.</p>
                        <a href="#" class="btn btn-sm btn-outline-success">Узнать больше</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
                <div class="animal-card">
                    <img src="data:image/jpeg;base64,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" alt="Полярная сова" class="animal-img">
                    <div class="p-4">
                        <h3>Полярная сова</h3>
                        <p>Крупная хищная птица, обитающая в тундре. В нашем зоопарке создан специальный вольер с условиями, имитирующими арктический климат.</p>
                        <a href="#" class="btn btn-sm btn-outline-success">Узнать больше</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="text-center mt-4" data-aos="fade-up">
            <a href="/animals" class="btn btn-primary">Все животные</a>
        </div>
    </div>
</section>

<!-- Волонтерство -->
<section class="volunteer-section" id="volunteer" data-aos="fade-up">
    <div class="container">
        <h2 class="section-title">Станьте волонтером</h2>
        <div class="row">
            <div class="col-lg-6" data-aos="fade-right">
                <img src="https://images.unsplash.com/photo-1548199973-03cce0bbc87b?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Волонтеры зоопарка" class="img-fluid rounded zoom-effect">
            </div>
            <div class="col-lg-6" data-aos="fade-left">
                <div class="volunteer-card">
                    <h3><i class="fas fa-hands-helping me-2"></i>Помощь животным</h3>
                    <p>Присоединяйтесь к нашей команде волонтеров и участвуйте в уходе за животными, подготовке кормов и обустройстве вольеров.</p>
                </div>
                <div class="volunteer-card">
                    <h3><i class="fas fa-chalkboard-teacher me-2"></i>Образовательные программы</h3>
                    <p>Помогайте проводи экскурсии и образовательные мероприятия для детей и взрослых, рассказывайте о важности сохранения biodiversity.</p>
                </div>
                <div class="volunteer-card">
                    <h3><i class="fas fa-seedling me-2"></i>Экологические инициативы</h3>
                    <p>Участвуйте в программах по озеленению территории, созданию экологических троп и природоохранных проектах.</p>
                </div>
                <a href="/volunteers" class="btn btn-primary mt-3">Присоединиться</a>
            </div>
        </div>
    </div>
</section>

<!-- Карта -->
<section class="py-5" id="map" style="padding: 100px 0;">
    <div class="container">
        <h2 class="section-title" data-aos="fade-up">Карта зоопарка</h2>
        <p class="text-center mb-5" data-aos="fade-up">Планируйте свой визит заранее с помощью интерактивной карты нашего зоопарка</p>
        <div class="map-container" data-aos="zoom-in">
            <img src="/mapZOO.jpg" alt="Карта зоопарка" class="img-fluid">
        </div>
    </div>
</section>

<!-- Для посетителей -->
<section class="py-5 bg-light" id="visitors" style="padding: 100px 0;">
    <div class="container">
        <h2 class="section-title" data-aos="fade-up">Популярность зоопарка</h2>
        <div class="row">
            <div class="col-md-6" data-aos="fade-right">
                <h3>Почему нас любят?</h3>
                <p>Зоопарк "Зелёный Мир" ежегодно посещают более 50 000 человек. Мы гордимся тем, что создали пространство, где:</p>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item bg-transparent"><i class="fas fa-check-circle text-success me-2"></i>Животные содержатся в условиях, максимально приближенных к естественным</li>
                    <li class="list-group-item bg-transparent"><i class="fas fa-check-circle text-success me-2"></i>Реализуются образовательные программы для всех возрастов</li>
                    <li class="list-group-item bg-transparent"><i class="fas fa-check-circle text-success me-2"></i>Проводятся научные исследования и природоохранные initiatives</li>
                    <li class="list-group-item bg-transparent"><i class="fas fa-check-circle text-success me-2"></i>Создана доступная среда для людей с ограниченными возможностями</li>
                </ul>
            </div>
            <div class="col-md-6" data-aos="fade-left">
                <h3>Как добраться?</h3>
                <div class="card mb-3">
                    <div class="card-body">
                        <h5><i class="fas fa-bus me-2"></i>Общественный транспорт</h5>
                        <p>Автобусы: 25, 38, 91 до остановки "Зоопарк"<br>Трамваи: 5, 7 до остановки "Центральный парк"</p>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <h5><i class="fas fa-car me-2"></i>На автомобиле</h5>
                        <p>Координаты для навигатора: 53.9023° N, 27.5619° E<br>Бесплатная парковка на 200 мест</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

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

        // Анимация счетчиков
        const counters = document.querySelectorAll('.stat-number');
        const speed = 200;

        counters.forEach(counter => {
            const target = +counter.getAttribute('data-count');
            const count = +counter.innerText;
            const increment = Math.ceil(target / speed);

            let current = 0;

            const updateCount = () => {
                if (current < target) {
                    current += increment;
                    if (current > target) current = target;
                    counter.innerText = current;
                    setTimeout(updateCount, 1);
                }
            };

            // Запуск при попадании в область видимости
            const observer = new IntersectionObserver((entries) => {
                if (entries[0].isIntersecting) {
                    updateCount();
                }
            });

            observer.observe(counter);
        });

        // Плавная прокрутка для навигации
        document.querySelectorAll('nav a').forEach(anchor => {
            anchor.addEventListener('click', function(e) {
                e.preventDefault();
                const targetId = this.getAttribute('href');
                if (targetId.startsWith('#')) {
                    const targetElement = document.querySelector(targetId);
                    if (targetElement) {
                        window.scrollTo({
                            top: targetElement.offsetTop - 76,
                            behavior: 'smooth'
                        });
                    }
                } else {
                    window.location.href = this.href;
                }
            });
        });
    });
</script>
</body>
</html>