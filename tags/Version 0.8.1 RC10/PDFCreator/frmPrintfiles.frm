VERSION 5.00
Begin VB.Form frmPrintfiles 
   Caption         =   "PDFCreator"
   ClientHeight    =   1965
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6150
   Icon            =   "frmPrintfiles.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   1965
   ScaleWidth      =   6150
   StartUpPosition =   3  'Windows-Standard
   Visible         =   0   'False
   Begin VB.CommandButton cmd 
      Cancel          =   -1  'True
      Caption         =   "&Cancel"
      Default         =   -1  'True
      Height          =   435
      Left            =   2160
      TabIndex        =   4
      Top             =   1440
      Width           =   1815
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   105
      Top             =   1365
   End
   Begin PDFCreator.XP_ProgressBar xpPgb 
      Height          =   330
      Left            =   210
      TabIndex        =   3
      Top             =   960
      Width           =   5685
      _extentx        =   10028
      _extenty        =   582
      font            =   "frmPrintfiles.frx":000C
      brushstyle      =   0
      color           =   6956042
   End
   Begin VB.Label lbl 
      AutoSize        =   -1  'True
      Caption         =   "1 (1)"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Index           =   2
      Left            =   2880
      TabIndex        =   2
      Top             =   720
      Width           =   405
   End
   Begin VB.Label lbl 
      AutoSize        =   -1  'True
      Caption         =   "Size:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Index           =   1
      Left            =   210
      TabIndex        =   1
      Top             =   525
      Width           =   435
   End
   Begin VB.Label lbl 
      AutoSize        =   -1  'True
      Caption         =   "File:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Index           =   0
      Left            =   210
      TabIndex        =   0
      Top             =   210
      Width           =   375
   End
End
Attribute VB_Name = "frmPrintfiles"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmd_Click()
'---ErrPtnr-OnError-START--- DO NOT MODIFY ! ---
On Error GoTo ErrPtnr_OnError
'---ErrPtnr-OnError-END--- DO NOT MODIFY ! ---
50010  CancelPrintfiles = True
50020  cmd.Enabled = False
'---ErrPtnr-OnError-START--- DO NOT MODIFY ! ---
Exit Sub
ErrPtnr_OnError:
Select Case ErrPtnr.OnError("frmPrintfiles", "cmd_Click")
Case 0: Resume
Case 1: Resume Next
Case 2: Exit Sub
Case 3: End
End Select
'---ErrPtnr-OnError-END--- DO NOT MODIFY ! ---
End Sub

Private Sub Form_Load()
'---ErrPtnr-OnError-START--- DO NOT MODIFY ! ---
On Error GoTo ErrPtnr_OnError
'---ErrPtnr-OnError-END--- DO NOT MODIFY ! ---
50010  Dim Files As Collection
50020  Me.Icon = LoadResPicture(2120, vbResIcon)
50030  CancelPrintfiles = False
50040  Caption = App.Title & " " & GetProgramReleaseStr
50050  RemoveX Me
50060  Set Files = GetFiles(PrintFilename, "")
50070  If Files.Count > 1 Then
50080   Visible = True
50090  End If
50100  lbl(0).Caption = LanguageStrings.ListFilename
50110  lbl(1).Caption = LanguageStrings.ListSize
50120  With xpPgb
50130   .Min = 1
50140   .Max = Files.Count
50150   .Color = vbGreen
50160   .Font.Bold = True
50170   .ShowText = True
50180  End With
50190  ShowAcceleratorsInForm Me, True
50200  Timer1.Enabled = True
'---ErrPtnr-OnError-START--- DO NOT MODIFY ! ---
Exit Sub
ErrPtnr_OnError:
Select Case ErrPtnr.OnError("frmPrintfiles", "Form_Load")
Case 0: Resume
Case 1: Resume Next
Case 2: Exit Sub
Case 3: End
End Select
'---ErrPtnr-OnError-END--- DO NOT MODIFY ! ---
End Sub

Private Sub Form_Resize()
'---ErrPtnr-OnError-START--- DO NOT MODIFY ! ---
On Error GoTo ErrPtnr_OnError
'---ErrPtnr-OnError-END--- DO NOT MODIFY ! ---
50010  If WindowState = vbMinimized Then
50020   Exit Sub
50030  End If
50040  xpPgb.Left = (Width - xpPgb.Width) / 2
50050  Move (Screen.Width - Width) / 2, (Screen.Height - Height) / 2
50060  cmd.Move (Width - cmd.Width) / 2, cmd.Top
'---ErrPtnr-OnError-START--- DO NOT MODIFY ! ---
Exit Sub
ErrPtnr_OnError:
Select Case ErrPtnr.OnError("frmPrintfiles", "Form_Resize")
Case 0: Resume
Case 1: Resume Next
Case 2: Exit Sub
Case 3: End
End Select
'---ErrPtnr-OnError-END--- DO NOT MODIFY ! ---
End Sub

Private Sub Timer1_Timer()
'---ErrPtnr-OnError-START--- DO NOT MODIFY ! ---
On Error GoTo ErrPtnr_OnError
'---ErrPtnr-OnError-END--- DO NOT MODIFY ! ---
50010  Timer1.Enabled = False
50020  PrintFile PrintFilename, Me, xpPgb, lbl(0), lbl(1), lbl(2)
50030  Unload Me
'---ErrPtnr-OnError-START--- DO NOT MODIFY ! ---
Exit Sub
ErrPtnr_OnError:
Select Case ErrPtnr.OnError("frmPrintfiles", "Timer1_Timer")
Case 0: Resume
Case 1: Resume Next
Case 2: Exit Sub
Case 3: End
End Select
'---ErrPtnr-OnError-END--- DO NOT MODIFY ! ---
End Sub
