<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Пожертвование зоопарку "Зелёный Мир"</title>
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



        .donation-hero {
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('https://images.unsplash.com/photo-1456926631375-92c8ce872def?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            padding: 120px 0 80px;
            color: white;
            text-align: center;
        }

        .donation-card {
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            border: none;
            margin-top: -50px;
        }

        .donation-card:hover {
            transform: translateY(-5px);
        }

        .donation-header {
            background-color: var(--primary-color);
            color: white;
            padding: 20px;
            text-align: center;
        }

        .benefits-section {
            padding: 80px 0;
            background-color: var(--secondary-color);
        }

        .benefit-card {
            text-align: center;
            padding: 30px 20px;
            border-radius: 10px;
            background: white;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transition: transform 0.3s ease;
            height: 100%;
        }

        .benefit-card:hover {
            transform: translateY(-10px);
        }

        .benefit-icon {
            font-size: 3rem;
            color: var(--primary-color);
            margin-bottom: 20px;
        }

        .impact-section {
            padding: 80px 0;
            background: linear-gradient(rgba(0,0,0,0.8), rgba(0,0,0,0.8)), url('https://images.unsplash.com/photo-1519003303723-5a0402d0bf87?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-attachment: fixed;
            color: white;
        }

        .impact-number {
            font-size: 3rem;
            font-weight: 700;
            color: var(--accent-color);
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

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(46, 139, 87, 0.25);
        }

        .donation-options {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin: 20px 0;
        }

        .donation-option {
            padding: 10px 20px;
            border: 2px solid var(--primary-color);
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .donation-option:hover, .donation-option.active {
            background-color: var(--primary-color);
            color: white;
        }

        @media (max-width: 768px) {
            .donation-options {
                flex-wrap: wrap;
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

<section class="donation-hero" data-aos="fade-in">
    <div class="container">
        <h1 class="display-4 fw-bold mb-4">Пожертвование зоопарку «Зелёный Мир»</h1>
        <p class="lead">Наши волонтёры заботятся о животных каждый день 🐒🐘🦁<br>Ваш вклад помогает покупать корм, лекарства и поддерживать вольеры</p>
    </div>
</section>

<div class="container mb-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card donation-card" data-aos="fade-up">
                <div class="donation-header">
                    <h3><i class="fas fa-heart me-2"></i>Сделать пожертвование</h3>
                </div>
                <div class="card-body p-5">
                    <form action="/donation" method="post">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="name" class="form-label">Имя</label>
                                <input type="text" id="name" name="name" class="form-control" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" id="email" name="email" class="form-control" value="${userEmail!}" required>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="comment" class="form-label">Комментарий (необязательно)</label>
                            <textarea id="comment" name="comment" class="form-control" rows="3" placeholder="На что вы хотели бы направить ваше пожертвование?"></textarea>
                        </div>

                        <div class="mb-4">
                            <label for="amount" class="form-label">Сумма пожертвования (BYN)</label>

                            <div class="donation-options">
                                <div class="donation-option" data-amount="10">10BYN</div>
                                <div class="donation-option" data-amount="25">25BYN</div>
                                <div class="donation-option" data-amount="50">50BYN</div>
                                <div class="donation-option" data-amount="100">100BYN</div>
                                <div class="donation-option" data-amount="custom">Другая</div>
                            </div>

                            <input type="number" min="1" id="amount" name="amount" step="0.01" class="form-control form-control-lg mt-3" required>
                        </div>

                        <button type="submit" class="btn btn-success w-100 btn-lg">
                            <i class="fas fa-donate me-2"></i>Пожертвовать
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<section class="benefits-section">
    <div class="container">
        <h2 class="text-center mb-5" data-aos="fade-up">Как ваше пожертвование помогает животным</h2>
        <div class="row">
            <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="100">
                <div class="benefit-card">
                    <div class="benefit-icon">
                        <i class="fas fa-utensils"></i>
                    </div>
                    <h4>Питание животных</h4>
                    <p>Обеспечиваем сбалансированное питание для всех обитателей зоопарка</p>
                </div>
            </div>
            <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="200">
                <div class="benefit-card">
                    <div class="benefit-icon">
                        <i class="fas fa-first-aid"></i>
                    </div>
                    <h4>Ветеринарная помощь</h4>
                    <p>Обеспечиваем регулярные осмотры и необходимое лечение</p>
                </div>
            </div>
            <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="300">
                <div class="benefit-card">
                    <div class="benefit-icon">
                        <i class="fas fa-home"></i>
                    </div>
                    <h4>Улучшение вольеров</h4>
                    <p>Создаем комфортные условия, приближенные к естественной среде</p>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="impact-section">
    <div class="container">
        <h2 class="text-center mb-5" data-aos="fade-up">Наше влияние вместе с вами</h2>
        <div class="row text-center">
            <div class="col-md-3 col-6 mb-4" data-aos="fade-up" data-aos-delay="100">
                <div class="impact-number">500+</div>
                <p>Животных получают регулярную помощь</p>
            </div>
            <div class="col-md-3 col-6 mb-4" data-aos="fade-up" data-aos-delay="200">
                <div class="impact-number">20+</div>
                <p>Вольеров было модернизировано в прошлом году</p>
            </div>
            <div class="col-md-3 col-6 mb-4" data-aos="fade-up" data-aos-delay="300">
                <div class="impact-number">15+</div>
                <p>Волонтеров работают ежедневно</p>
            </div>
            <div class="col-md-3 col-6 mb-4" data-aos="fade-up" data-aos-delay="400">
                <div class="impact-number">1000+</div>
                <p>Детей участвуют в образовательных программах ежегодно</p>
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

    document.addEventListener('DOMContentLoaded', function() {
        AOS.init({
            duration: 1000,
            once: true,
            easing: 'ease-in-out'
        });

        const donationOptions = document.querySelectorAll('.donation-option');
        const amountInput = document.getElementById('amount');

        donationOptions.forEach(option => {
            option.addEventListener('click', function() {
                donationOptions.forEach(opt => opt.classList.remove('active'));

                this.classList.add('active');

                if (this.dataset.amount !== 'custom') {
                    amountInput.value = this.dataset.amount;
                } else {
                    amountInput.value = '';
                    amountInput.focus();
                }
            });
        });

        amountInput.addEventListener('input', function() {
            if (this.value) {
                donationOptions.forEach(opt => {
                    if (opt.dataset.amount === 'custom') {
                        opt.classList.add('active');
                    } else {
                        opt.classList.remove('active');
                    }
                });
            }
        });
    });
</script>
</body>
</html>