from PyQt5 import uic, QtWidgets
import sys
import mysql.connector

banco = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="Dan2809!",
    database="db_supermercado"
)

def funcao_principal():
    linha1 = interface_cadastro.lineEdit.text()
    linha2 = interface_cadastro.lineEdit_2.text()
    linha3 = interface_cadastro.lineEdit_3.text()
    linha4 = interface_cadastro.lineEdit_4.text()
    categoria = ""

    if interface_cadastro.radioButton.isChecked():
        print("Categoria Condimentos selecionada")
        categoria = "Condimentos"
    elif interface_cadastro.radioButton_2.isChecked():
        print("Categoria Alimentos Frescos selecionada")
        categoria = "Alimentos Frescos"
    elif interface_cadastro.radioButton_3.isChecked():
        print("Categoria Bebidas selecionada")
        categoria = "Bebidas"
    elif interface_cadastro.radioButton_4.isChecked():
        print("Categoria Limpeza Doméstica selecionada")
        categoria = "Limpeza Doméstica"
    elif interface_cadastro.radioButton_5.isChecked():
        print("Categoria Higiene Pessoal selecionada")
        categoria = "Higiene Pessoal"
    elif interface_cadastro.radioButton_6.isChecked():
        print("Categoria Congelados selecionada")
        categoria = "Congelados"
    elif interface_cadastro.radioButton_7.isChecked():
        print("Categoria Carnes e Peixes selecionada")
        categoria = "Carnes e Peixes"
    elif interface_cadastro.radioButton_8.isChecked():
        print("Categoria Ovos e Laticínios selecionada")
        categoria = "Ovos e Laticínios"
    elif interface_cadastro.radioButton_9.isChecked():
        print("Categoria Casa e decoração selecionada")
        categoria = "Casa e Decoração"
    else:
        print("Nenhuma categoria selecionada")
        categoria = "Nenhuma"

    print("Código:", linha1)
    print("Preço:", linha2)
    print("Nome:", linha3)
    print("Quantidade/Estoque:", linha4)

    cursor = banco.cursor()
    comando_SQL = "INSERT INTO produto (Nome, Categoria, Preco, Estoque, Codigo) VALUES (%s,%s,%s,%s,%s)"
    dados = (linha3, categoria, linha2, linha4, linha1)  
    cursor.execute(comando_SQL, dados)
    banco.commit()
    print("Produto cadastrado com sucesso!")

app = QtWidgets.QApplication([])
interface_cadastro = uic.loadUi("interface_cadastro.ui")
interface_cadastro.pushButton.clicked.connect(funcao_principal)

interface_cadastro.show()
sys.exit(app.exec_())
