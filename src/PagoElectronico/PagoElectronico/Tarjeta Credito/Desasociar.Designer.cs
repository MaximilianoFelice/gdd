﻿namespace PagoElectronico.Tarjeta_Credito
{
    partial class Desasociar
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.maskedTextBox_numeroTarjeta = new System.Windows.Forms.MaskedTextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.comboBox_Numero_Tarjeta = new System.Windows.Forms.ComboBox();
            this.maskedTextBox_codigo = new System.Windows.Forms.MaskedTextBox();
            this.textBox_NombreTitular = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.textBox_Emisor = new System.Windows.Forms.TextBox();
            this.button_Guardar = new System.Windows.Forms.Button();
            this.button_Cerrar = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.maskedTextBox_numeroTarjeta);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.comboBox_Numero_Tarjeta);
            this.groupBox1.Controls.Add(this.maskedTextBox_codigo);
            this.groupBox1.Controls.Add(this.textBox_NombreTitular);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.textBox_Emisor);
            this.groupBox1.Location = new System.Drawing.Point(12, 11);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(810, 410);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Datos de la tarjeta de crédito";
            // 
            // maskedTextBox_numeroTarjeta
            // 
            this.maskedTextBox_numeroTarjeta.Location = new System.Drawing.Point(338, 189);
            this.maskedTextBox_numeroTarjeta.Mask = "9999999999999999";
            this.maskedTextBox_numeroTarjeta.Name = "maskedTextBox_numeroTarjeta";
            this.maskedTextBox_numeroTarjeta.Size = new System.Drawing.Size(114, 20);
            this.maskedTextBox_numeroTarjeta.TabIndex = 1;
            this.maskedTextBox_numeroTarjeta.Click += new System.EventHandler(this.maskedTextBox_numeroTarjeta_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(193, 192);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(137, 13);
            this.label2.TabIndex = 47;
            this.label2.Text = "Número de tarjeta completo";
            // 
            // comboBox_Numero_Tarjeta
            // 
            this.comboBox_Numero_Tarjeta.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBox_Numero_Tarjeta.FormattingEnabled = true;
            this.comboBox_Numero_Tarjeta.Location = new System.Drawing.Point(338, 157);
            this.comboBox_Numero_Tarjeta.Name = "comboBox_Numero_Tarjeta";
            this.comboBox_Numero_Tarjeta.Size = new System.Drawing.Size(248, 21);
            this.comboBox_Numero_Tarjeta.TabIndex = 0;
            this.comboBox_Numero_Tarjeta.SelectedIndexChanged += new System.EventHandler(this.comboBox_Numero_Tarjeta_SelectedIndexChanged);
            // 
            // maskedTextBox_codigo
            // 
            this.maskedTextBox_codigo.Location = new System.Drawing.Point(338, 241);
            this.maskedTextBox_codigo.Mask = "999";
            this.maskedTextBox_codigo.Name = "maskedTextBox_codigo";
            this.maskedTextBox_codigo.Size = new System.Drawing.Size(34, 20);
            this.maskedTextBox_codigo.TabIndex = 2;
            this.maskedTextBox_codigo.Click += new System.EventHandler(this.maskedTextBox_codigo_Click);
            // 
            // textBox_NombreTitular
            // 
            this.textBox_NombreTitular.Location = new System.Drawing.Point(338, 215);
            this.textBox_NombreTitular.Name = "textBox_NombreTitular";
            this.textBox_NombreTitular.ReadOnly = true;
            this.textBox_NombreTitular.Size = new System.Drawing.Size(249, 20);
            this.textBox_NombreTitular.TabIndex = 1;
            this.textBox_NombreTitular.TabStop = false;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(226, 244);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(104, 13);
            this.label5.TabIndex = 44;
            this.label5.Text = "Código de seguridad";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(243, 218);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(89, 13);
            this.label4.TabIndex = 43;
            this.label4.Text = "Nombre del titular";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(240, 157);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(91, 13);
            this.label3.TabIndex = 42;
            this.label3.Text = "Número de tarjeta";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(294, 270);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(38, 13);
            this.label1.TabIndex = 39;
            this.label1.Text = "Emisor";
            // 
            // textBox_Emisor
            // 
            this.textBox_Emisor.Location = new System.Drawing.Point(338, 268);
            this.textBox_Emisor.Name = "textBox_Emisor";
            this.textBox_Emisor.ReadOnly = true;
            this.textBox_Emisor.Size = new System.Drawing.Size(186, 20);
            this.textBox_Emisor.TabIndex = 45;
            this.textBox_Emisor.TabStop = false;
            // 
            // button_Guardar
            // 
            this.button_Guardar.Location = new System.Drawing.Point(666, 427);
            this.button_Guardar.Name = "button_Guardar";
            this.button_Guardar.Size = new System.Drawing.Size(75, 23);
            this.button_Guardar.TabIndex = 3;
            this.button_Guardar.Text = "Borrar";
            this.button_Guardar.UseVisualStyleBackColor = true;
            this.button_Guardar.Click += new System.EventHandler(this.button_Guardar_Click);
            // 
            // button_Cerrar
            // 
            this.button_Cerrar.Location = new System.Drawing.Point(747, 427);
            this.button_Cerrar.Name = "button_Cerrar";
            this.button_Cerrar.Size = new System.Drawing.Size(75, 23);
            this.button_Cerrar.TabIndex = 4;
            this.button_Cerrar.Text = "Cerrar";
            this.button_Cerrar.UseVisualStyleBackColor = true;
            this.button_Cerrar.Click += new System.EventHandler(this.button_Cerrar_Click);
            // 
            // Desasociar
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(834, 461);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.button_Guardar);
            this.Controls.Add(this.button_Cerrar);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "Desasociar";
            this.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Hide;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Desasociar";
            this.Load += new System.EventHandler(this.Desasociar_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.ComboBox comboBox_Numero_Tarjeta;
        private System.Windows.Forms.MaskedTextBox maskedTextBox_codigo;
        private System.Windows.Forms.TextBox textBox_NombreTitular;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button button_Guardar;
        private System.Windows.Forms.Button button_Cerrar;
        private System.Windows.Forms.TextBox textBox_Emisor;
        private System.Windows.Forms.MaskedTextBox maskedTextBox_numeroTarjeta;
        private System.Windows.Forms.Label label2;
    }
}