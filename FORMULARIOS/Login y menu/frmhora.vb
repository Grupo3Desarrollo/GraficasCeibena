﻿Public Class frmhora

    Private Sub timerhora_Tick(sender As Object, e As EventArgs) Handles timerhora.Tick
        labelhora1.Text = TimeOfDay.TimeOfDay.ToString
    End Sub

    Private Sub timerfecha_Tick(sender As Object, e As EventArgs) Handles timerfecha.Tick
        Dim fecha As String
        fecha = DateTimePicker12.Text
        fechita.Text = fecha
    End Sub

    Private Sub frmhora_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        timerfecha.Start()
        DateTimePicker12.Visible = False
    End Sub

    Private Sub labelfecha_Click(sender As Object, e As EventArgs)

    End Sub

    Private Sub labelhora1_Click(sender As Object, e As EventArgs) Handles labelhora1.Click

    End Sub
End Class