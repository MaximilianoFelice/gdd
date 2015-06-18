﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using PagoElectronico.Model;
using PagoElectronico.CapaDAO;

namespace PagoElectronico.Transferencias
{
    public partial class Transferencia : FormBase
    {
        private ABM_Cuenta.Seleccion selec;

        public Transferencia()
        {
            InitializeComponent();
        }

        private void button_Cerrar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Transferencia_Load(object sender, EventArgs e)
        {
            DataTable cuentas = CapaDAO.DAOTransferencia.getCuentas();
            DataTable monedas = CapaDAO.DAOTransferencia.getMonedas();

            comboBox_Origen.ValueMember = "CUE_ID";
            comboBox_Origen.DisplayMember = "CUE_ID";
            comboBox_Origen.DataSource = cuentas;

            comboBox_Moneda.ValueMember = "MON_ID";
            comboBox_Moneda.DisplayMember = "NOMBRE";
            comboBox_Moneda.DataSource = monedas;

            textBox_Fecha.Text = Globals.getFechaSistema();
        }

        private void textBox_Importe_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) && (e.KeyChar != ','))
            {
                e.Handled = true;
            }

            if ((e.KeyChar == ',') && ((sender as TextBox).Text.IndexOf(',') > -1))
            {
                e.Handled = true;
            }
        }

        private void button_Aceptar_Click(object sender, EventArgs e)
        {
            if (!camposCorrectos())
            {
                MessageBox.Show("No están todos los datos obligatorios", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            string ret = CapaDAO.DAOTransferencia.realizarTransferencia(Convert.ToInt64(comboBox_Origen.SelectedValue), Convert.ToInt64(textBox_Destino.Text), textBox_Fecha.Text, Convert.ToDouble(textBox_Importe.Text), Convert.ToInt32(comboBox_Moneda.SelectedValue));

            if (ret == "s")
                MessageBox.Show("Saldo insuficiente", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            else
                MessageBox.Show("La transferencia fue registrada correctamente", "", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
        }

        private bool camposCorrectos()
        {
            try
            {
                if (Convert.ToDouble(textBox_Importe.Text) <= 0)
                {
                    MessageBox.Show("El importe debe ser mayor a 0", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
                }
            }
            catch (Exception)
            {
                MessageBox.Show("El importe debe tener formato numérico", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            return comboBox_Origen.Text != "" && textBox_Destino.Text != "" && comboBox_Moneda.Text != "";
        }

        private void button_Limpiar_Click(object sender, EventArgs e)
        {
            textBox_Importe.Text = "";
            textBox_Fecha.Text = Globals.getFechaSistema();
        }

        private void button_SeleccionarCuentaDestino_Click(object sender, EventArgs e)
        {
            selec = new ABM_Cuenta.Seleccion(this, textBox_Destino);
            selec.MdiParent = this.MdiParent;
            selec.Show();
        }

    }
}
