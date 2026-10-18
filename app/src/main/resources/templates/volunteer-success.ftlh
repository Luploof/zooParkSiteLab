<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Заявка отправлена — Зоопарк "Зелёный Мир"</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #2e8b57;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .success-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.1);
            padding: 40px;
            text-align: center;
            max-width: 500px;
            width: 100%;
        }

        .success-icon {
            font-size: 4rem;
            color: var(--primary-color);
            margin-bottom: 20px;
        }

        .btn-success {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            padding: 12px 30px;
            border-radius: 50px;
            font-weight: 600;
        }
    </style>
</head>
<body>
<div class="success-card">
    <div class="success-icon">
        <i class="fas fa-check-circle"></i>
    </div>
    <h2>Заявка отправлена!</h2>
    <p class="lead">Спасибо за вашу заявку на волонтерство. Мы свяжемся с вами в ближайшее время.</p>
    <p class="text-muted">Обычно мы отвечаем в течение 2-3 рабочих дней.</p>
    <div class="mt-4">
        <a href="/volunteers" class="btn btn-success me-3">
            <i class="fas fa-arrow-left me-2"></i>Назад к волонтерству
        </a>
        <a href="/" class="btn btn-outline-success">
            <i class="fas fa-home me-2"></i>На главную
        </a>
    </div>
</div>
</body>
</html>