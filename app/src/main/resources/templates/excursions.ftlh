<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Экскурсии — Зоопарк "Зелёный Мир"</title>
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

        .excursions-hero {
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url('https://images.unsplash.com/photo-1593069567131-53a0614dde1d?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            padding: 100px 0 60px;
            color: white;
            text-align: center;
            margin-bottom: 40px;
        }

        .excursion-detail-card {
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            margin-bottom: 40px;
            border: none;
            background: white;
            overflow: hidden;
        }

        .excursion-image {
            height: 300px;
            object-fit: cover;
            width: 100%;
        }

        .excursion-info {
            padding: 30px;
        }

        .excursion-icon {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 15px;
        }

        .excursion-features {
            list-style: none;
            padding: 0;
            margin: 20px 0;
        }

        .excursion-features li {
            padding: 8px 0;
            border-bottom: 1px solid #eee;
        }

        .excursion-features li:last-child {
            border-bottom: none;
        }

        .excursion-features li i {
            color: var(--primary-color);
            margin-right: 10px;
            width: 20px;
        }

        .btn-book {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            padding: 12px 30px;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.3s ease;
            margin-top: 20px;
        }

        .btn-book:hover {
            background-color: #267349;
            border-color: #267349;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .modal-content {
            border-radius: 15px;
            border: none;
            box-shadow: 0 20px 60px rgba(0,0,0,0.2);
        }

        .modal-header {
            background-color: var(--primary-color);
            color: white;
            border-radius: 15px 15px 0 0;
            border: none;
        }

        .modal-footer {
            border-top: 1px solid #eee;
            border-radius: 0 0 15px 15px;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(46, 139, 87, 0.25);
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

        .thank-modal .modal-content {
            text-align: center;
            padding: 30px;
        }

        .thank-icon {
            font-size: 4rem;
            color: var(--primary-color);
            margin-bottom: 20px;
        }

        .duration-badge {
            background-color: var(--primary-color);
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 0.9rem;
            margin-left: 10px;
        }

        @media (max-width: 768px) {
            .excursions-hero {
                padding: 80px 0 40px;
            }

            .excursion-image {
                height: 250px;
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
                <li class="nav-item"><a class="nav-link" href="/animals">Животные</a></li>
                <li class="nav-item"><a class="nav-link" href="/tickets">Купить билет</a></li>
                <li class="nav-item"><a class="nav-link active" href="/excursions">Экскурсии</a></li>
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
<section class="excursions-hero" data-aos="fade-in">
    <div class="container">
        <h1 class="display-4 fw-bold mb-4">Экскурсии по зоопарку</h1>
        <p class="lead">Погрузитесь в удивительный мир дикой природы с нашими экскурсиями</p>
    </div>
</section>

<!-- Детальные описания экскурсий -->
<div class="container">
    <!-- Обзорная экскурсия -->
    <div class="excursion-detail-card" data-aos="fade-up">
        <div class="row g-0">
            <div class="col-md-6">
                <img src="https://images.unsplash.com/photo-1548199973-03cce0bbc87b?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80"
                     class="excursion-image" alt="Обзорная экскурсия">
            </div>
            <div class="col-md-6">
                <div class="excursion-info">
                    <div class="excursion-icon">
                        <i class="fas fa-binoculars"></i>
                    </div>
                    <h3>Обзорная экскурсия <span class="duration-badge">2 часа</span></h3>
                    <p class="text-muted">Знакомство со всеми обитателями зоопарка</p>

                    <p>Идеальная экскурсия для первого знакомства с нашим зоопарком. Вы посетите все основные экспозиции и узнаете интересные факты о каждом животном.</p>

                    <ul class="excursion-features">
                        <li><i class="fas fa-check"></i>Посещение всех вольеров и павильонов</li>
                        <li><i class="fas fa-check"></i>Профессиональный гид-зоолог</li>
                        <li><i class="fas fa-check"></i>Фотосессия с животными</li>
                        <li><i class="fas fa-check"></i>Интерактивная карта зоопарка</li>
                    </ul>

                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h4 class="text-success mb-0">20BYN с человека</h4>
                            <small class="text-muted">группы от 5 человек</small>
                        </div>
                        <button class="btn btn-book" data-bs-toggle="modal" data-bs-target="#bookModal"
                                data-excursion="Обзорная экскурсия">
                            <i class="fas fa-calendar-check me-2"></i>Забронировать
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Экскурсия для детей -->
    <div class="excursion-detail-card" data-aos="fade-up" data-aos-delay="100">
        <div class="row g-0">
            <div class="col-md-6 order-md-2">
                <img src="https://images.unsplash.com/photo-1534567153574-2b12153a87f0?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80"
                     class="excursion-image" alt="Экскурсия для детей">
            </div>
            <div class="col-md-6 order-md-1">
                <div class="excursion-info">
                    <div class="excursion-icon">
                        <i class="fas fa-child"></i>
                    </div>
                    <h3>Экскурсия для детей <span class="duration-badge">1.5 часа</span></h3>
                    <p class="text-muted">Интерактивная программа для маленьких посетителей</p>

                    <p>Специально разработанная программа для детей, где learning through play - главный принцип. Игры, загадки и интерактивные задания.</p>

                    <ul class="excursion-features">
                        <li><i class="fas fa-check"></i>Игровая форма проведения</li>
                        <li><i class="fas fa-check"></i>Интерактивные задания и квесты</li>
                        <li><i class="fas fa-check"></i>Безопасное общение с животными</li>
                        <li><i class="fas fa-check"></i>Сувенир на память каждому ребенку</li>
                    </ul>

                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h4 class="text-success mb-0">15BYN с ребенка</h4>
                            <small class="text-muted">+ 2 сопровождающих бесплатно</small>
                        </div>
                        <button class="btn btn-book" data-bs-toggle="modal" data-bs-target="#bookModal"
                                data-excursion="Экскурсия для детей">
                            <i class="fas fa-calendar-check me-2"></i>Забронировать
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Тематическая экскурсия -->
    <div class="excursion-detail-card" data-aos="fade-up" data-aos-delay="200">
        <div class="row g-0">
            <div class="col-md-6">
                <img src="https://images.unsplash.com/photo-1564349683136-77e08dba1ef7?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80"
                     class="excursion-image" alt="Тематическая экскурсия">
            </div>
            <div class="col-md-6">
                <div class="excursion-info">
                    <div class="excursion-icon">
                        <i class="fas fa-book"></i>
                    </div>
                    <h3>Тематическая экскурсия <span class="duration-badge">2.5 часа</span></h3>
                    <p class="text-muted">Глубокое погружение в мир конкретных видов животных</p>

                    <p>Для настоящих ценителей природы. Углубленное изучение конкретных видов животных, их поведения, привычек и conservation status.</p>

                    <ul class="excursion-features">
                        <li><i class="fas fa-check"></i>Углубленное изучение конкретных видов</li>
                        <li><i class="fas fa-check"></i>Встреча с зоологами и researchers</li>
                        <li><i class="fas fa-check"></i>Посещение research facilities</li>
                        <li><i class="fas fa-check"></i>Эксклюзивные материалы и презентации</li>
                    </ul>

                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h4 class="text-success mb-0">25BYN с человека</h4>
                            <small class="text-muted">максимум 10 человек в группе</small>
                        </div>
                        <button class="btn btn-book" data-bs-toggle="modal" data-bs-target="#bookModal"
                                data-excursion="Тематическая экскурсия">
                            <i class="fas fa-calendar-check me-2"></i>Забронировать
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Модальное окно для заказа экскурсии -->
<div class="modal fade" id="bookModal" tabindex="-1" aria-labelledby="bookModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form id="bookingForm">
                <div class="modal-header">
                    <h5 class="modal-title" id="bookModalLabel">Заказ экскурсии</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="excursionName" name="excursionName">

                    <div class="mb-4 text-center">
                        <div class="excursion-icon">
                            <i class="fas fa-ticket-alt"></i>
                        </div>
                        <h4 id="selectedExcursion">Выбранная экскурсия</h4>
                    </div>

                    <div class="mb-3">
                        <label for="userEmail" class="form-label">Ваша почта</label>
                        <input type="email" class="form-control" id="userEmail" name="userEmail"
                               value="${userEmail!}" required>
                    </div>

                    <div class="mb-3">
                        <label for="userName" class="form-label">Ваше имя</label>
                        <input type="text" class="form-control" id="userName" name="userName" required>
                    </div>

                    <div class="mb-3">
                        <label for="amount" class="form-label">Количество участников</label>
                        <input type="number" min="1" step="1" class="form-control" id="amount" name="amount" required>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">
                        <i class="fas fa-check me-2"></i>Подтвердить заказ
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Модальное окно "Спасибо за заказ" -->
<div class="modal fade thank-modal" id="thankModal" tabindex="-1" aria-labelledby="thankModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body text-center p-5">
                <div class="thank-icon">
                    <i class="fas fa-check-circle"></i>
                </div>
                <h3 class="mb-3">Спасибо за заказ!</h3>
                <p class="mb-4">Ваша заявка успешно отправлена. С вами свяжутся по почте для подтверждения деталей экскурсии.</p>
                <button type="button" class="btn btn-success" data-bs-dismiss="modal">
                    <i class="fas fa-home me-2"></i>Вернуться на сайт
                </button>
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
                <p>Экскурсии проводятся по предварительной записи</p>
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
    document.addEventListener('DOMContentLoaded', function() {
        AOS.init({
            duration: 1000,
            once: true,
            easing: 'ease-in-out'
        });

        const bookModal = document.getElementById('bookModal');
        bookModal.addEventListener('show.bs.modal', function (event) {
            const button = event.relatedTarget;
            const excursion = button.getAttribute('data-excursion');

            // Устанавливаем значения в скрытое поле
            document.getElementById('excursionName').value = excursion;

            // Обновляем информацию в модальном окне
            document.getElementById('selectedExcursion').textContent = excursion;
        });

        // Обработка формы заказа
        const bookingForm = document.getElementById('bookingForm');
        bookingForm.addEventListener('submit', function(e) {
            e.preventDefault();

            const data = new URLSearchParams();
            data.append('excursionName', document.getElementById('excursionName').value);
            data.append('userEmail', document.getElementById('userEmail').value);
            data.append('userName', document.getElementById('userName').value);
            data.append('amount', document.getElementById('amount').value);

            fetch('/excursions/book', {
                method: 'POST',
                body: data
            }).then(response => response.text())
                .then(result => {
                    if(result === 'success') {
                        // Закрываем модальное окно заказа
                        const modalInstance = bootstrap.Modal.getInstance(bookModal);
                        modalInstance.hide();

                        // Показываем модальное окно благодарности
                        const thankModal = new bootstrap.Modal(document.getElementById('thankModal'));
                        thankModal.show();

                        // Очищаем форму
                        bookingForm.reset();
                    } else {
                        alert('Ошибка при отправке заявки. Попробуйте ещё раз.');
                    }
                });
        });

    });
</script>
</body>
</html>