<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Купить билет — Зоопарк "Зелёный Мир"</title>
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

        .ticket-hero {
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url('https://images.unsplash.com/photo-1593069567131-53a0614dde1d?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            padding: 100px 0 60px;
            color: white;
            text-align: center;
            margin-bottom: 40px;
        }

        .ticket-container {
            max-width: 1000px;
            margin: 0 auto;
        }

        .info-card {
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            padding: 30px;
            margin-bottom: 20px;
            background: white;
            border: none;
        }

        .price-card {
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            padding: 15px;
            margin-bottom: 15px;
            background: white;
            text-align: center;
            transition: transform 0.3s ease;
            border: none;
            cursor: pointer;
        }

        .price-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0,0,0,0.15);
        }

        .price-card h5 {
            color: var(--primary-color);
            margin-bottom: 15px;
        }

        .price-amount {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--primary-color);
            margin: 10px 0;
        }

        .price-period {
            font-size: 0.9rem;
            color: #6c757d;
        }

        .ticket-form {
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            padding: 30px;
            background: white;
            border: none;
        }

        .btn-ticket {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            padding: 12px 30px;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.3s ease;
            width: 100%;
        }

        .btn-ticket:hover {
            background-color: #267349;
            border-color: #267349;
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(46, 139, 87, 0.25);
        }

        .form-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(46, 139, 87, 0.25);
        }

        .benefits-list {
            list-style: none;
            padding: 0;
        }

        .benefits-list li {
            padding: 8px 0;
            border-bottom: 1px solid #eee;
        }

        .benefits-list li:last-child {
            border-bottom: none;
        }

        .benefits-list li i {
            color: var(--primary-color);
            margin-right: 10px;
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

        .success-alert {
            border-radius: 15px;
            border: none;
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

        @media (max-width: 768px) {
            .ticket-hero {
                padding: 80px 0 40px;
            }

            .price-card {
                margin-bottom: 20px;
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
                <li class="nav-item"><a class="nav-link active" href="/tickets">Купить билет</a></li>
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

<section class="ticket-hero" data-aos="fade-in">
    <div class="container">
        <h1 class="display-4 fw-bold mb-4">Купить билет в зоопарк</h1>
        <p class="lead">Откройте для себя удивительный мир дикой природы</p>
    </div>
</section>

<div class="container ticket-container">
    <div class="row">
        <div class="col-lg-6 mb-4">
            <div class="info-card" data-aos="fade-right">
                <h3 class="mb-4"><i class="fas fa-info-circle me-2"></i>Информация</h3>
                <div class="mb-4">
                    <h5><i class="fas fa-map-marker-alt me-2"></i>Адрес:</h5>
                    <p>Минск, ул. Природная, 15</p>
                </div>
                <div class="mb-4">
                    <h5><i class="fas fa-clock me-2"></i>Время работы:</h5>
                    <p>Ежедневно: с 10:00 до 20:00</p>
                    <p class="text-muted">Кассы закрываются за час до окончания работы</p>
                </div>
                <div>
                    <h5><i class="fas fa-gift me-2"></i>Что включено:</h5>
                    <ul class="benefits-list">
                        <li><i class="fas fa-check"></i>Посещение всех экспозиций</li>
                        <li><i class="fas fa-check"></i>Фото с животными (в разрешённых зонах)</li>
                        <li><i class="fas fa-check"></i>Детские игровые площадки</li>
                        <li><i class="fas fa-check"></i>Карта зоопарка</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="col-lg-6 mb-4">
            <div class="info-card" data-aos="fade-left">
                <h3 class="mb-4"><i class="fas fa-ticket-alt me-2"></i>Цены на билеты</h3>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <div class="price-card" data-bs-toggle="modal" data-bs-target="#orderModal" data-ticket-type="adult" data-ticket-price="20">
                            <h5>Взрослый</h5>
                            <div class="price-amount">20BYN</div>
                            <p class="price-period">от 18 лет</p>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <div class="price-card" data-bs-toggle="modal" data-bs-target="#orderModal" data-ticket-type="child" data-ticket-price="10">
                            <h5>Детский</h5>
                            <div class="price-amount">10BYN</div>
                            <p class="price-period">от 3 до 17 лет</p>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <div class="price-card" data-bs-toggle="modal" data-bs-target="#orderModal" data-ticket-type="benefit" data-ticket-price="15">
                            <h5>Льготный</h5>
                            <div class="price-amount">15BYN</div>
                            <p class="price-period">студенты, пенсионеры</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>

<!-- Модальное окно для быстрого заказа -->
<div class="modal fade" id="orderModal" tabindex="-1" aria-labelledby="orderModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="orderModalLabel">Быстрый заказ билета</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="quickOrderForm" method="post" action="/tickets">
                    <input type="hidden" id="modalTicketType" name="ticketType">

                    <div class="mb-4 text-center">
                        <h4 id="modalTicketTitle"></h4>
                        <div class="price-amount" id="modalTicketPrice"></div>
                        <p class="text-muted" id="modalTicketDescription"></p>
                    </div>

                    <div class="mb-3">
                        <label for="modalQuantity" class="form-label">Количество билетов:</label>
                        <input type="number" class="form-control form-control-lg" id="modalQuantity" name="quantity" min="1" value="1" required>
                    </div>

                    <div class="mb-3">
                        <label for="customerEmail" class="form-label">Email:</label>
                        <input type="email" class="form-control" id="customerEmail" name="customerEmail" required>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="submit" form="quickOrderForm" class="btn btn-ticket">
                    <i class="fas fa-check me-2"></i>Подтвердить заказ
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

        // Обработка модального окна
        const orderModal = document.getElementById('orderModal');
        orderModal.addEventListener('show.bs.modal', function (event) {
            const button = event.relatedTarget;
            const ticketType = button.getAttribute('data-ticket-type');
            const ticketPrice = button.getAttribute('data-ticket-price');

            // Устанавливаем значения в скрытое поле
            document.getElementById('modalTicketType').value = ticketType;

            // Обновляем информацию в модальном окне
            const modalTitle = document.getElementById('modalTicketTitle');
            const modalPrice = document.getElementById('modalTicketPrice');
            const modalDescription = document.getElementById('modalTicketDescription');

            switch(ticketType) {
                case 'adult':
                    modalTitle.textContent = 'Взрослый билет';
                    modalDescription.textContent = 'Для посетителей от 18 лет';
                    break;
                case 'child':
                    modalTitle.textContent = 'Детский билет';
                    modalDescription.textContent = 'Для детей от 3 до 17 лет';
                    break;
                case 'benefit':
                    modalTitle.textContent = 'Льготный билет';
                    modalDescription.textContent = 'Для студентов и пенсионеров';
                    break;
            }

            modalPrice.textContent = ticketPrice + 'BYN';
        });

        // Динамическое обновление общей стоимости
        const modalQuantity = document.getElementById('modalQuantity');
        modalQuantity.addEventListener('input', updateTotalPrice);

        function updateTotalPrice() {
            // Здесь можно добавить логику для отображения общей стоимости
            // на основе выбранного типа билета и количества
        }
    });
</script>
</body>
</html>