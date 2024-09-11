package janelas;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;
import java.util.Scanner;

public class FormularioTurma extends JFrame{

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// Atributo de instância 
	
    private JLabel lbNumero1;
    private JTextField txNumero1;
    private JLabel lbNumero2;
    private JTextField txNumero2;

    public FormularioTurma() {    	
    	Scanner ler = new Scanner(System.in);
        // Número 1
        lbNumero1 = new JLabel(); // Inicializando o JLabel(TEXTO)
        lbNumero1.setText("Primeiro Número: ");
        lbNumero1.setBounds(50, 100, 175, 35); // Posição x(horizontal),y(vertical) e largura e altura
        add(lbNumero1);

        txNumero1 = new JTextField(); // Inicializando o JTextField(INSERIR) 
        txNumero1.setBounds(175, 100, 150, 35); 
        add(txNumero1);
        
        // Número 2
        lbNumero2 = new JLabel(); // Inicializando o JLabel(TEXTO)
        lbNumero2.setText("Segundo Número: ");
        lbNumero2.setBounds(50, 150, 175, 35); // Posição x(horizontal),y(vertical) e largura e altura
        add(lbNumero2);
        
        txNumero2 = new JTextField(); // Inicializando o JTextField(INSERIR)
        txNumero2.setBounds(175, 150, 150, 35); // 
        add(txNumero2);
        
   
        
        // CONFIGURAÇÕES
        setTitle("Protótipo");
        setSize(800, 600);  // Largura e altura (pixels)
        setDefaultCloseOperation(EXIT_ON_CLOSE); // Libera da memória ao fechar
        setLayout(null);
        setResizable(false); // Não será possível redimensionar o tamanho da janela
        setLocationRelativeTo(null); // Centraliza a janela na tela
        setVisible(true); // SEMPRE A ÚLTIMA LINHA (False por padrão)
	    /* Seu código
    import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;


public class FormularioTurma extends JFrame {


	private static final long serialVersionUID = 1L;
	private JLabel lbNome;
	private JTextField txNome;
	private JButton btEnviar;
	private JTextField txResult;
	private JLabel lbResult;

	public FormularioTurma() {

		setTitle("Calculadora-protótipo");
		setSize(900, 700); // largura e altura
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setLayout(null);
		setResizable(false);
		setLocationRelativeTo(null);

		lbNome = new JLabel();
		lbNome.setText("Primeiro valor: ");
		lbNome.setBounds(100, 100, 200, 80); //posição x, posição y, largura e altura
		add(lbNome);

		txNome = new JTextField();
		txNome.setBounds(220, 120, 140, 45); //posição x, posição y, largura e altura
		add(txNome);

		btEnviar = new JButton();
		btEnviar.setBounds(205, 200, 100, 30); //posição x, posição y, largura e altura
		btEnviar.setText("Somar");
		add(btEnviar);

		btEnviar = new JButton();
		btEnviar.setBounds(305, 200, 100, 30); //posição x, posição y, largura e altura
		btEnviar.setText("Subtrair");
		add(btEnviar);



		lbNome = new JLabel();
		lbNome.setText("Segundo valor: ");
		lbNome.setBounds(500, 100, 200, 80); //posição x, posição y, largura e altura
		add(lbNome);

		txNome = new JTextField();
		txNome.setBounds(600, 120, 140, 45); //posição x, posição y, largura e altura
		add(txNome);

		btEnviar = new JButton();
		btEnviar.setBounds(405, 200, 100, 30); //posição x, posição y, largura e altura
		btEnviar.setText("Multiplicar");
		add(btEnviar);

		btEnviar = new JButton();
		btEnviar.setBounds(505, 200, 100, 30); //posição x, posição y, largura e altura
		btEnviar.setText("Dividir");
		add(btEnviar);

		lbResult = new JLabel();
		lbResult.setText("Resultado: ");
		lbNome.setBounds(350, 300, 200, 80); //posição x, posição y, largura e altura
		add(lbResult);

		txResult = new JTextField();
		txResult.setBounds(350, 350, 140, 45); //posição x, posição y, largura e altura
		add(txResult);


		setVisible(true);
	}
}
     */
    }
}
