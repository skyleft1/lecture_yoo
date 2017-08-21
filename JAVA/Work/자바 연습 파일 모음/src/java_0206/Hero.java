package java_0206;

import java.util.Random;
public class Hero {
    private String name;
    private int hp = 100;
    // ������
    public Hero(String name) {
        this.name = name;
    }
    // ��ġ
    public void punch(Hero enermy) {
        enermy.hp -= 10;
        System.out.printf("[%s]�� ��ġ\n", this.name);
        System.out.printf("\t%s: %d/100\n", enermy.name, enermy.hp);
    }
    // �׽�Ʈ �ڵ�
    public static void main(String[] args) throws InterruptedException {
        Hero arthas = new Hero("�Ƽ���");
        Hero leona = new Hero("������");
        Random random = new Random();
        while (arthas.hp > 0 && leona.hp > 0) {
            Boolean isArthasTurn = random.nextBoolean(); 
            Hero attacker = isArthasTurn ? arthas : leona;
            Hero defender = isArthasTurn ? leona : arthas;
            attacker.punch(defender);
            Thread.sleep(1000);
        }
    }
}