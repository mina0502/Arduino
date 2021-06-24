namespace HelloCSharpWin
{
    partial class Calculator
    {
        /// <summary>
        /// 필수 디자이너 변수입니다.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 사용 중인 모든 리소스를 정리합니다.
        /// </summary>
        /// <param name="disposing">관리되는 리소스를 삭제해야 하면 true이고, 그렇지 않으면 false입니다.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form 디자이너에서 생성한 코드

        /// <summary>
        /// 디자이너 지원에 필요한 메서드입니다.
        /// 이 메서드의 내용을 코드 편집기로 수정하지 마십시오.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.notifyIcon1 = new System.Windows.Forms.NotifyIcon(this.components);
            this.NumButton1 = new System.Windows.Forms.Button();
            this.NumButton2 = new System.Windows.Forms.Button();
            this.NumScreen = new System.Windows.Forms.Label();
            this.NumPlus = new System.Windows.Forms.Button();
            this.NumButton3 = new System.Windows.Forms.Button();
            this.NumButton4 = new System.Windows.Forms.Button();
            this.NumButton5 = new System.Windows.Forms.Button();
            this.NumButton6 = new System.Windows.Forms.Button();
            this.NumButton7 = new System.Windows.Forms.Button();
            this.NumButton8 = new System.Windows.Forms.Button();
            this.NumButton9 = new System.Windows.Forms.Button();
            this.NumButton0 = new System.Windows.Forms.Button();
            this.NumSub = new System.Windows.Forms.Button();
            this.NumDiv = new System.Windows.Forms.Button();
            this.NumMul = new System.Windows.Forms.Button();
            this.ResultButton = new System.Windows.Forms.Button();
            this.reset = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // notifyIcon1
            // 
            this.notifyIcon1.Text = "notifyIcon1";
            this.notifyIcon1.Visible = true;
            // 
            // NumButton1
            // 
            this.NumButton1.Location = new System.Drawing.Point(31, 349);
            this.NumButton1.Name = "NumButton1";
            this.NumButton1.Size = new System.Drawing.Size(69, 72);
            this.NumButton1.TabIndex = 0;
            this.NumButton1.Text = "1";
            this.NumButton1.UseVisualStyleBackColor = true;
            this.NumButton1.Click += new System.EventHandler(this.NumButton1_Click);
            // 
            // NumButton2
            // 
            this.NumButton2.Location = new System.Drawing.Point(127, 347);
            this.NumButton2.Name = "NumButton2";
            this.NumButton2.Size = new System.Drawing.Size(70, 72);
            this.NumButton2.TabIndex = 1;
            this.NumButton2.Text = "2";
            this.NumButton2.UseVisualStyleBackColor = true;
            this.NumButton2.Click += new System.EventHandler(this.NumButton2_Click);
            // 
            // NumScreen
            // 
            this.NumScreen.BackColor = System.Drawing.Color.White;
            this.NumScreen.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.NumScreen.Font = new System.Drawing.Font("굴림", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(129)));
            this.NumScreen.Location = new System.Drawing.Point(22, 9);
            this.NumScreen.Name = "NumScreen";
            this.NumScreen.Size = new System.Drawing.Size(369, 67);
            this.NumScreen.TabIndex = 2;
            this.NumScreen.Text = "0";
            this.NumScreen.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // NumPlus
            // 
            this.NumPlus.Location = new System.Drawing.Point(312, 246);
            this.NumPlus.Name = "NumPlus";
            this.NumPlus.Size = new System.Drawing.Size(70, 47);
            this.NumPlus.TabIndex = 3;
            this.NumPlus.Text = "+";
            this.NumPlus.UseVisualStyleBackColor = true;
            this.NumPlus.Click += new System.EventHandler(this.NumPlus_Click);
            // 
            // NumButton3
            // 
            this.NumButton3.Location = new System.Drawing.Point(218, 349);
            this.NumButton3.Name = "NumButton3";
            this.NumButton3.Size = new System.Drawing.Size(76, 73);
            this.NumButton3.TabIndex = 4;
            this.NumButton3.Text = "3";
            this.NumButton3.UseVisualStyleBackColor = true;
            this.NumButton3.Click += new System.EventHandler(this.NumButton3_Click);
            // 
            // NumButton4
            // 
            this.NumButton4.Location = new System.Drawing.Point(31, 264);
            this.NumButton4.Name = "NumButton4";
            this.NumButton4.Size = new System.Drawing.Size(69, 74);
            this.NumButton4.TabIndex = 5;
            this.NumButton4.Text = "4";
            this.NumButton4.UseVisualStyleBackColor = true;
            this.NumButton4.Click += new System.EventHandler(this.NumButton4_Click);
            // 
            // NumButton5
            // 
            this.NumButton5.Location = new System.Drawing.Point(127, 265);
            this.NumButton5.Name = "NumButton5";
            this.NumButton5.Size = new System.Drawing.Size(70, 73);
            this.NumButton5.TabIndex = 6;
            this.NumButton5.Text = "5";
            this.NumButton5.UseVisualStyleBackColor = true;
            this.NumButton5.Click += new System.EventHandler(this.NumButton5_Click);
            // 
            // NumButton6
            // 
            this.NumButton6.Location = new System.Drawing.Point(218, 264);
            this.NumButton6.Name = "NumButton6";
            this.NumButton6.Size = new System.Drawing.Size(76, 74);
            this.NumButton6.TabIndex = 7;
            this.NumButton6.Text = "6";
            this.NumButton6.UseVisualStyleBackColor = true;
            this.NumButton6.Click += new System.EventHandler(this.NumButton6_Click);
            // 
            // NumButton7
            // 
            this.NumButton7.Location = new System.Drawing.Point(31, 178);
            this.NumButton7.Name = "NumButton7";
            this.NumButton7.Size = new System.Drawing.Size(63, 74);
            this.NumButton7.TabIndex = 8;
            this.NumButton7.Text = "7";
            this.NumButton7.UseVisualStyleBackColor = true;
            this.NumButton7.Click += new System.EventHandler(this.NumButton7_Click);
            // 
            // NumButton8
            // 
            this.NumButton8.Location = new System.Drawing.Point(127, 175);
            this.NumButton8.Name = "NumButton8";
            this.NumButton8.Size = new System.Drawing.Size(71, 74);
            this.NumButton8.TabIndex = 9;
            this.NumButton8.Text = "8";
            this.NumButton8.UseVisualStyleBackColor = true;
            this.NumButton8.Click += new System.EventHandler(this.NumButton8_Click);
            // 
            // NumButton9
            // 
            this.NumButton9.Location = new System.Drawing.Point(218, 177);
            this.NumButton9.Name = "NumButton9";
            this.NumButton9.Size = new System.Drawing.Size(76, 72);
            this.NumButton9.TabIndex = 10;
            this.NumButton9.Text = "9";
            this.NumButton9.UseVisualStyleBackColor = true;
            this.NumButton9.Click += new System.EventHandler(this.NumButton9_Click);
            // 
            // NumButton0
            // 
            this.NumButton0.Location = new System.Drawing.Point(126, 442);
            this.NumButton0.Name = "NumButton0";
            this.NumButton0.Size = new System.Drawing.Size(70, 64);
            this.NumButton0.TabIndex = 11;
            this.NumButton0.Text = "0";
            this.NumButton0.UseVisualStyleBackColor = true;
            this.NumButton0.Click += new System.EventHandler(this.NumButton0_Click);
            // 
            // NumSub
            // 
            this.NumSub.Location = new System.Drawing.Point(313, 178);
            this.NumSub.Name = "NumSub";
            this.NumSub.Size = new System.Drawing.Size(69, 52);
            this.NumSub.TabIndex = 12;
            this.NumSub.Text = "-";
            this.NumSub.UseVisualStyleBackColor = true;
            this.NumSub.Click += new System.EventHandler(this.NumSub_Click);
            // 
            // NumDiv
            // 
            this.NumDiv.Location = new System.Drawing.Point(311, 309);
            this.NumDiv.Name = "NumDiv";
            this.NumDiv.Size = new System.Drawing.Size(69, 47);
            this.NumDiv.TabIndex = 13;
            this.NumDiv.Text = "/";
            this.NumDiv.UseVisualStyleBackColor = true;
            this.NumDiv.Click += new System.EventHandler(this.NumDiv_Click);
            // 
            // NumMul
            // 
            this.NumMul.Location = new System.Drawing.Point(312, 374);
            this.NumMul.Name = "NumMul";
            this.NumMul.Size = new System.Drawing.Size(68, 45);
            this.NumMul.TabIndex = 14;
            this.NumMul.Text = "*";
            this.NumMul.UseVisualStyleBackColor = true;
            this.NumMul.Click += new System.EventHandler(this.NumMul_Click);
            // 
            // ResultButton
            // 
            this.ResultButton.Location = new System.Drawing.Point(313, 442);
            this.ResultButton.Name = "ResultButton";
            this.ResultButton.Size = new System.Drawing.Size(66, 63);
            this.ResultButton.TabIndex = 15;
            this.ResultButton.Text = "=";
            this.ResultButton.UseVisualStyleBackColor = true;
            this.ResultButton.Click += new System.EventHandler(this.ResultButton_Click);
            // 
            // reset
            // 
            this.reset.Location = new System.Drawing.Point(220, 90);
            this.reset.Name = "reset";
            this.reset.Size = new System.Drawing.Size(74, 71);
            this.reset.TabIndex = 16;
            this.reset.Text = "C";
            this.reset.UseVisualStyleBackColor = true;
            this.reset.Click += new System.EventHandler(this.reset_Click);
            // 
            // Calculator
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(406, 585);
            this.Controls.Add(this.reset);
            this.Controls.Add(this.ResultButton);
            this.Controls.Add(this.NumMul);
            this.Controls.Add(this.NumDiv);
            this.Controls.Add(this.NumSub);
            this.Controls.Add(this.NumButton0);
            this.Controls.Add(this.NumButton9);
            this.Controls.Add(this.NumButton8);
            this.Controls.Add(this.NumButton7);
            this.Controls.Add(this.NumButton6);
            this.Controls.Add(this.NumButton5);
            this.Controls.Add(this.NumButton4);
            this.Controls.Add(this.NumButton3);
            this.Controls.Add(this.NumPlus);
            this.Controls.Add(this.NumScreen);
            this.Controls.Add(this.NumButton2);
            this.Controls.Add(this.NumButton1);
            this.Name = "Calculator";
            this.Text = "Form1";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.NotifyIcon notifyIcon1;
        private System.Windows.Forms.Button NumButton1;
        private System.Windows.Forms.Button NumButton2;
        private System.Windows.Forms.Label NumScreen;
        private System.Windows.Forms.Button NumPlus;
        private System.Windows.Forms.Button NumButton3;
        private System.Windows.Forms.Button NumButton4;
        private System.Windows.Forms.Button NumButton5;
        private System.Windows.Forms.Button NumButton6;
        private System.Windows.Forms.Button NumButton7;
        private System.Windows.Forms.Button NumButton8;
        private System.Windows.Forms.Button NumButton9;
        private System.Windows.Forms.Button NumButton0;
        private System.Windows.Forms.Button NumSub;
        private System.Windows.Forms.Button NumDiv;
        private System.Windows.Forms.Button NumMul;
        private System.Windows.Forms.Button ResultButton;
        private System.Windows.Forms.Button reset;
    }
}

