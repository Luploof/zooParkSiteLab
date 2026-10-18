<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Волонтерство — Зоопарк "Зелёный Мир"</title>
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

        .volunteer-hero {
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url('https://images.unsplash.com/photo-1548199973-03cce0bbc87b?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            padding: 120px 0 80px;
            color: white;
            text-align: center;
            margin-bottom: 40px;
        }

        .benefit-card {
            text-align: center;
            padding: 30px 20px;
            border-radius: 15px;
            background: white;
            box-shadow: 0 5px 20px rgba(0,0,0,0.05);
            transition: transform 0.3s ease;
            height: 100%;
            margin-bottom: 30px;
        }

        .benefit-card:hover {
            transform: translateY(-10px);
        }

        .benefit-icon {
            font-size: 3rem;
            color: var(--primary-color);
            margin-bottom: 20px;
        }

        .volunteer-stats {
            background: linear-gradient(135deg, var(--primary-color) 0%, #267349 100%);
            color: white;
            padding: 80px 0;
            margin: 60px 0;
        }

        .stat-number {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .stat-label {
            font-size: 1.1rem;
            opacity: 0.9;
        }

        .volunteer-form {
            background: white;
            border-radius: 20px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.1);
            padding: 40px;
            margin: 40px 0;
        }

        .btn-volunteer {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            padding: 12px 30px;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-volunteer:hover {
            background-color: #267349;
            border-color: #267349;
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(46, 139, 87, 0.25);
        }

        .testimonial-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.05);
            padding: 30px;
            margin: 20px 0;
            border-left: 5px solid var(--primary-color);
        }

        .testimonial-avatar {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 15px;
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
            .volunteer-hero {
                padding: 100px 0 60px;
            }

            .volunteer-form {
                padding: 30px 20px;
            }

            .stat-number {
                font-size: 2.5rem;
            }
        }
    </style>
</head>
<body>
<!-- Навигационная панель -->
<nav class="navbar navbar-expand-lg navbar-dark bg-success fixed-top">
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
                <li class="nav-item"><a class="nav-link" href="/animals">Животные</a></li>
                <li class="nav-item"><a class="nav-link" href="/tickets">Купить билет</a></li>
                <li class="nav-item"><a class="nav-link" href="/excursions">Экскурсии</a></li>
                <li class="nav-item"><a class="nav-link active" href="/volunteers">Волонтерство</a></li>
            </ul>
        </div>
        <div class="d-flex">
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
<section class="volunteer-hero" data-aos="fade-in">
    <div class="container">
        <h1 class="display-4 fw-bold mb-4">Станьте волонтером</h1>
        <p class="lead mb-0">Помогите нам заботиться о животных и сохранять природу</p>
    </div>
</section>

<!-- Основной контент -->
<div class="container" style="padding-top: 20px;">
    <!-- Призыв к действию -->
    <div class="row mb-5">
        <div class="col-lg-8 mx-auto text-center">
            <h2 class="section-title" data-aos="fade-up">Присоединяйтесь к нашей команде</h2>
            <p class="lead" data-aos="fade-up" data-aos-delay="100">
                Каждый день наши волонтеры делают мир лучше для животных. Присоединяйтесь к нам и станьте частью чего-то большего!
            </p>
        </div>
    </div>

    <!-- Преимущества волонтерства -->
    <div class="row mb-5">
        <div class="col-lg-4 mb-4" data-aos="fade-up" data-aos-delay="100">
            <div class="benefit-card">
                <div class="benefit-icon">
                    <i class="fas fa-hands-helping"></i>
                </div>
                <h4>Помощь животным</h4>
                <p>Участвуйте в уходе за животными, подготовке кормов и обустройстве вольеров</p>
            </div>
        </div>
        <div class="col-lg-4 mb-4" data-aos="fade-up" data-aos-delay="200">
            <div class="benefit-card">
                <div class="benefit-icon">
                    <i class="fas fa-chalkboard-teacher"></i>
                </div>
                <h4>Образовательные программы</h4>
                <p>Помогайте проводить экскурсии и образовательные мероприятия для детей и взрослых</p>
            </div>
        </div>
        <div class="col-lg-4 mb-4" data-aos="fade-up" data-aos-delay="300">
            <div class="benefit-card">
                <div class="benefit-icon">
                    <i class="fas fa-seedling"></i>
                </div>
                <h4>Экологические инициативы</h4>
                <p>Участвуйте в программах по озеленению территории и природоохранных проектах</p>
            </div>
        </div>
    </div>

    <!-- Статистика -->
    <div class="volunteer-stats" data-aos="fade-up">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-3 col-6 mb-4">
                    <div class="stat-number">150+</div>
                    <div class="stat-label">Волонтеров</div>
                </div>
                <div class="col-md-3 col-6 mb-4">
                    <div class="stat-number">5000+</div>
                    <div class="stat-label">Часов помощи</div>
                </div>
                <div class="col-md-3 col-6 mb-4">
                    <div class="stat-number">200+</div>
                    <div class="stat-label">Мероприятий</div>
                </div>
                <div class="col-md-3 col-6 mb-4">
                    <div class="stat-number">100%</div>
                    <div class="stat-label">Довольных волонтеров</div>
                </div>
            </div>
        </div>
    </div>

    <!-- Как стать волонтером -->
    <div class="row mb-5">
        <div class="col-lg-8 mx-auto">
            <h2 class="section-title" data-aos="fade-up">Как стать волонтером</h2>
            <div class="row">
                <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="100">
                    <div class="text-center">
                        <div class="benefit-icon">
                            <i class="fas fa-1"></i>
                        </div>
                        <h5>Заполните заявку</h5>
                        <p>Расскажите о себе и своих интересах</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="200">
                    <div class="text-center">
                        <div class="benefit-icon">
                            <i class="fas fa-2"></i>
                        </div>
                        <h5>Пройти обучение</h5>
                        <p>Получите необходимые знания и инструкции</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="300">
                    <div class="text-center">
                        <div class="benefit-icon">
                            <i class="fas fa-3"></i>
                        </div>
                        <h5>Начать помогать</h5>
                        <p>Приступайте к волонтерской деятельности</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Форма заявки -->
    <div class="row">
        <div class="col-lg-8 mx-auto">
            <div class="volunteer-form" data-aos="zoom-in">
                <h3 class="text-center mb-4">Стать волонтером</h3>
                <form method="post" action="/volunteers/apply">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="firstName" class="form-label">Имя</label>
                            <input type="text" class="form-control" id="firstName" name="firstName" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="lastName" class="form-label">Фамилия</label>
                            <input type="text" class="form-control" id="lastName" name="lastName" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="phone" class="form-label">Телефон</label>
                            <input type="tel" class="form-control" id="phone" name="phone" required>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="interests" class="form-label">Области интересов</label>
                        <select class="form-select" id="interests" name="interests" multiple>
                            <option value="animal_care">Уход за животными</option>
                            <option value="education">Образовательные программы</option>
                            <option value="gardening">Озеленение территории</option>
                            <option value="events">Организация мероприятий</option>
                            <option value="fundraising">Фандрайзинг</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="experience" class="form-label">Опыт волонтерства</label>
                        <textarea class="form-control" id="experience" name="experience" rows="3" placeholder="Расскажите о вашем предыдущем опыте волонтерства"></textarea>
                    </div>

                    <div class="mb-3">
                        <label for="availability" class="form-label">Доступность</label>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="weekdays" name="availability" value="weekdays">
                            <label class="form-check-label" for="weekdays">Будние дни</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="weekends" name="availability" value="weekends">
                            <label class="form-check-label" for="weekends">Выходные дни</label>
                        </div>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-volunteer btn-lg">
                            <i class="fas fa-handshake me-2"></i>Отправить заявку
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Отзывы волонтеров -->
    <div class="row mb-5">
        <div class="col-lg-10 mx-auto">
            <h2 class="section-title" data-aos="fade-up">Отзывы наших волонтеров</h2>
            <div class="row">
                <div class="col-md-6 mb-4" data-aos="fade-up" data-aos-delay="100">
                    <div class="testimonial-card">
                        <div class="d-flex align-items-center mb-3">
                            <img src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&auto=format&fit=crop&w=100&q=80"
                                 alt="Анна" class="testimonial-avatar">
                            <div>
                                <h5 class="mb-0">Анна</h5>
                                <p class="text-muted mb-0">Волонтер 2 года</p>
                            </div>
                        </div>
                        <p class="mb-0">"Волонтерство в зоопарке изменило мою жизнь. Я не только помогаю животным, но и нашла новых друзей и научилась многому новому."</p>
                    </div>
                </div>
                <div class="col-md-6 mb-4" data-aos="fade-up" data-aos-delay="200">
                    <div class="testimonial-card">
                        <div class="d-flex align-items-center mb-3">
                            <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&auto=format&fit=crop&w=100&q=80"
                                 alt="Максим" class="testimonial-avatar">
                            <div>
                                <h5 class="mb-0">Максим</h5>
                                <p class="text-muted mb-0">Волонтер 1 год</p>
                            </div>
                        </div>
                        <p class="mb-0">"Лучшее решение в моей жизни - стать волонтером. Каждый день приносит новые впечатления и возможность сделать что-то важное."</p>
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
                <p><i class="fas fa-envelope me-2"></i>volunteerGreenWorld@zoo.by</p>
                <p><i class="fas fa-map-marker-alt me-2"></i>Минск, ул. Природная, 15</p>
            </div>
            <div class="col-lg-4 mb-4">
                <h4>Волонтерский отдел</h4>
                <p>Пн-Пт: 9:00 - 18:00</p>
                <p>Сб: 10:00 - 16:00</p>
                <p>Вс: выходной</p>
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