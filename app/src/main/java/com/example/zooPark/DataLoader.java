package com.example.zooPark;

import com.example.zooPark.model.Animal;
import com.example.zooPark.repository.AnimalRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class DataLoader implements CommandLineRunner {

    private final AnimalRepository animalRepository;

    @Override
    public void run(String... args) {
        if(animalRepository.count() == 0) {

            animalRepository.save(new Animal("Лев", "Африканский лев", 120, 190, "Король зверей, социальное животное, живущее в прайдах.", "/images/lion.jpg"));
            animalRepository.save(new Animal("Тигр", "Бенгальский тигр", 110, 220, "Крупнейший представитель кошачьих с характерными полосками.", "/images/tiger.jpg"));
            animalRepository.save(new Animal("Бурый медведь", "Евразийский бурый медведь", 150, 300, "Крупный хищник, всеядный, впадает в зимнюю спячку.", "/images/bear.jpg"));
            animalRepository.save(new Animal("Волк", "Серый волк", 85, 60, "Социальный хищник, живущий в стаях с сложной иерархией.", "/images/wolf.jpg"));
            animalRepository.save(new Animal("Рысь", "Обыкновенная рысь", 65, 30, "Хищник с кисточками на ушах, отличный охотник.", "/images/lynx.jpg"));

            animalRepository.save(new Animal("Жираф", "Масайский жираф", 500, 800, "Самое высокое наземное животное с длинной шеей.", "/images/giraffe.jpg"));
            animalRepository.save(new Animal("Слон", "Африканский слон", 330, 6000, "Крупнейшее наземное животное с хоботом и бивнями.", "/images/elephant.jpg"));
            animalRepository.save(new Animal("Зебра", "Равнинная зебра", 150, 350, "Травоядное животное с характерными черно-белыми полосами.", "/images/zebra.jpg"));
            animalRepository.save(new Animal("Носорог", "Белый носорог", 180, 2300, "Крупное травоядное с одним или двумя рогами на носу.", "/images/rhino.jpg"));
            animalRepository.save(new Animal("Бизон", "Американский бизон", 186, 1000, "Крупное парнокопытное, символ американских прерий.", "/images/bison.jpg"));

            animalRepository.save(new Animal("Орёл", "Беркут", 100, 7, "Крупная хищная птица с мощным клювом и острым зрением.", "/images/eagle.jpg"));
            animalRepository.save(new Animal("Фламинго", "Обыкновенный фламинго", 145, 3, "Розовая птица с длинными ногами и изогнутым клювом.", "/images/flamingo.jpg"));
            animalRepository.save(new Animal("Павлин", "Обыкновенный павлин", 100, 5, "Птица с ярким оперением и роскошным хвостом.", "/images/peacock.jpg"));
            animalRepository.save(new Animal("Пингвин", "Императорский пингвин", 120, 45, "Нелетающая птица, отлично плавающая в холодных водах.", "/images/penguin.jpg"));
            animalRepository.save(new Animal("Сова", "Полярная сова", 70, 3, "Хищная птица с белым оперением и острым зрением.", "/images/owl.jpg"));

            animalRepository.save(new Animal("Крокодил", "Нильский крокодил", 150, 500, "Крупная рептилия, опасный хищник, живущий в воде.", "/images/crocodile.jpg"));
            animalRepository.save(new Animal("Питон", "Тигровый питон", 200, 90, "Крупная змея, неядовитая, убивающая добычу удушением.", "/images/python.jpg"));
            animalRepository.save(new Animal("Черепаха", "Слоновая черепаха", 120, 300, "Гигантская черепаха с Галапагосских островов.", "/images/tortoise.jpg"));
            animalRepository.save(new Animal("Игуана", "Зелёная игуана", 60, 8, "Крупная ящерица, питающаяся растительностью.", "/images/iguana.jpg"));
            animalRepository.save(new Animal("Варан", "Комодский варан", 200, 70, "Крупнейшая ящерица в мире, опасный хищник.", "/images/komodo.jpg"));

            animalRepository.save(new Animal("Орангутан", "Борнейский орангутан", 140, 80, "Крупная человекообразная обезьяна с рыжей шерстью.", "/images/orangutan.jpg"));
            animalRepository.save(new Animal("Горилла", "Западная равнинная горилла", 170, 160, "Крупнейшая человекообразная обезьяна, социальное животное.", "/images/gorilla.jpg"));
            animalRepository.save(new Animal("Шимпанзе", "Обыкновенный шимпанзе", 130, 60, "Ближайший родственник человека, очень умное животное.", "/images/chimpanzee.jpg"));
            animalRepository.save(new Animal("Лемур", "Кошачий лемур", 40, 3, "Примат с длинным полосатым хвостом, обитает на Мадагаскаре.", "/images/lemur.jpg"));
            animalRepository.save(new Animal("Мандрил", "Обыкновенный мандрил", 80, 30, "Яркоокрашенная обезьяна с красной и синей мордой.", "/images/mandrill.jpg"));
        }
    }
}
