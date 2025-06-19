import nodemailer from "nodemailer";
import logger from "../utils/logger.utils";

const transporter = nodemailer.createTransport({
  host: process.env.EMAIL_HOST,
  port: parseInt(process.env.EMAIL_PORT || "465"),
  secure: true,
  auth: {
    user: process.env.EMAIL_USER,
    pass: process.env.EMAIL_PASS,
  },
});

transporter.verify((error: any) => {
  if (error) {
    logger.error("Email transporter configuration error:", error);
  } else {
    logger.info("Email server is ready to take our messages");
  }
});

export const sendResetPasswordEmail = async (
  email: string,
  resetToken: string,
  userName: string
) => {
  const resetUrl = `${process.env.NEXT_PUBLIC_BASE_URL}/reset-password?token=${resetToken}`;

  const htmlContent = `
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reset Your Password</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body {
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
                line-height: 1.6;
                color: #333;
                background-color: #f4f4f4;
            }
            .container {
                max-width: 600px;
                margin: 0 auto;
                background-color: #ffffff;
                border-radius: 8px;
                overflow: hidden;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
            .header {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                padding: 40px 30px;
                text-align: center;
            }
            .header h1 {
                font-size: 28px;
                margin-bottom: 10px;
                font-weight: 600;
            }
            .header p {
                font-size: 16px;
                opacity: 0.9;
            }
            .content {
                padding: 40px 30px;
            }
            .greeting {
                font-size: 18px;
                margin-bottom: 20px;
                color: #2c3e50;
            }
            .message {
                font-size: 16px;
                line-height: 1.8;
                margin-bottom: 30px;
                color: #555;
            }
            .button-container {
                text-align: center;
                margin: 40px 0;
            }
            .reset-button {
                display: inline-block;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                text-decoration: none;
                padding: 16px 32px;
                border-radius: 6px;
                font-weight: 600;
                font-size: 16px;
                transition: all 0.3s ease;
                box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
            }
            .reset-button:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 20px rgba(102, 126, 234, 0.6);
            }
            .alternative-link {
                background-color: #f8f9fa;
                border: 1px solid #e9ecef;
                border-radius: 6px;
                padding: 20px;
                margin: 30px 0;
            }
            .alternative-link p {
                font-size: 14px;
                color: #6c757d;
                margin-bottom: 10px;
            }
            .alternative-link a {
                color: #667eea;
                word-break: break-all;
                text-decoration: none;
            }
            .security-notice {
                background-color: #fff3cd;
                border: 1px solid #ffeaa7;
                border-radius: 6px;
                padding: 20px;
                margin: 30px 0;
            }
            .security-notice h3 {
                color: #856404;
                font-size: 16px;
                margin-bottom: 10px;
            }
            .security-notice p {
                color: #856404;
                font-size: 14px;
                line-height: 1.6;
            }
            .footer {
                background-color: #f8f9fa;
                padding: 30px;
                text-align: center;
                border-top: 1px solid #e9ecef;
            }
            .footer p {
                color: #6c757d;
                font-size: 14px;
                margin-bottom: 10px;
            }
            .footer .company-name {
                font-weight: 600;
                color: #495057;
            }
            @media (max-width: 600px) {
                .container {
                    margin: 0 10px;
                }
                .header, .content, .footer {
                    padding: 30px 20px;
                }
                .header h1 {
                    font-size: 24px;
                }
                .reset-button {
                    padding: 14px 28px;
                    font-size: 15px;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1>🔐 Password Reset</h1>
                <p>Secure access to your account</p>
            </div>
            
            <div class="content">
                <div class="greeting">
                    Hello ${userName},
                </div>
                
                <div class="message">
                    We received a request to reset the password for your account. If you didn't make this request, you can safely ignore this email.
                </div>
                
                <div class="button-container">
                    <a href="${resetUrl}" class="reset-button">Reset My Password</a>
                </div>
                
                <div class="alternative-link">
                    <p><strong>Button not working?</strong> Copy and paste this link into your browser:</p>
                    <a href="${resetUrl}">${resetUrl}</a>
                </div>
                
                <div class="security-notice">
                    <h3>🛡️ Security Notice</h3>
                    <p>
                        This password reset link will expire in <strong>1 hour</strong> for your security. 
                        If you didn't request this reset, please contact our support team immediately.
                    </p>
                </div>
            </div>
            
            <div class="footer">
                <p class="company-name">Your Company Name</p>
                <p>This email was sent from an automated system. Please do not reply to this email.</p>
                <p>If you have any questions, contact our support team.</p>
            </div>
        </div>
    </body>
    </html>
  `;

  const textContent = `
    Password Reset Request
    
    Hello ${userName},
    
    We received a request to reset the password for your account.
    
    To reset your password, click the following link:
    ${resetUrl}
    
    This link will expire in 1 hour for your security.
    
    If you didn't request this reset, you can safely ignore this email.
    
    Best regards,
    Your Company Team
  `;

  const mailOptions = {
    from: {
      name: "Your Company Name",
      address: process.env.EMAIL_USER!,
    },
    to: email,
    subject: "🔐 Reset Your Password - Action Required",
    text: textContent,
    html: htmlContent,
  };

  try {
    const info = await transporter.sendMail(mailOptions);
    logger.info(
      `Password reset email sent successfully to ${email}:`,
      info.messageId
    );
    return { success: true, messageId: info.messageId };
  } catch (error) {
    logger.error(`Failed to send password reset email to ${email}:`, error);
    throw error;
  }
};

export const sendPasswordResetSuccessEmail = async (
  email: string,
  userName: string
) => {
  const htmlContent = `
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Password Reset Successful</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body {
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
                line-height: 1.6;
                color: #333;
                background-color: #f4f4f4;
            }
            .container {
                max-width: 600px;
                margin: 0 auto;
                background-color: #ffffff;
                border-radius: 8px;
                overflow: hidden;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
            .header {
                background: linear-gradient(135deg, #00b894 0%, #00cec9 100%);
                color: white;
                padding: 40px 30px;
                text-align: center;
            }
            .header h1 {
                font-size: 28px;
                margin-bottom: 10px;
                font-weight: 600;
            }
            .header p {
                font-size: 16px;
                opacity: 0.9;
            }
            .content {
                padding: 40px 30px;
            }
            .success-icon {
                text-align: center;
                font-size: 60px;
                margin-bottom: 20px;
            }
            .greeting {
                font-size: 18px;
                margin-bottom: 20px;
                color: #2c3e50;
            }
            .message {
                font-size: 16px;
                line-height: 1.8;
                margin-bottom: 30px;
                color: #555;
            }
            .security-tips {
                background-color: #e8f5e8;
                border: 1px solid #c3e6c3;
                border-radius: 6px;
                padding: 20px;
                margin: 30px 0;
            }
            .security-tips h3 {
                color: #155724;
                font-size: 16px;
                margin-bottom: 15px;
            }
            .security-tips ul {
                color: #155724;
                font-size: 14px;
                line-height: 1.6;
                padding-left: 20px;
            }
            .security-tips li {
                margin-bottom: 8px;
            }
            .footer {
                background-color: #f8f9fa;
                padding: 30px;
                text-align: center;
                border-top: 1px solid #e9ecef;
            }
            .footer p {
                color: #6c757d;
                font-size: 14px;
                margin-bottom: 10px;
            }
            .footer .company-name {
                font-weight: 600;
                color: #495057;
            }
            @media (max-width: 600px) {
                .container {
                    margin: 0 10px;
                }
                .header, .content, .footer {
                    padding: 30px 20px;
                }
                .header h1 {
                    font-size: 24px;
                }
                .success-icon {
                    font-size: 50px;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1>✅ Password Reset Successful</h1>
                <p>Your account is now secure</p>
            </div>
            
            <div class="content">
                <div class="success-icon">🎉</div>
                
                <div class="greeting">
                    Hello ${userName},
                </div>
                
                <div class="message">
                    Great news! Your password has been successfully reset. You can now log in to your account using your new password.
                </div>
                
                <div class="security-tips">
                    <h3>🔒 Security Tips</h3>
                    <ul>
                        <li>Keep your password secure and don't share it with anyone</li>
                        <li>Use a unique password that you haven't used elsewhere</li>
                        <li>Consider enabling two-factor authentication for extra security</li>
                        <li>If you notice any suspicious activity, contact us immediately</li>
                    </ul>
                </div>
                
                <div class="message">
                    If you didn't reset your password, please contact our support team immediately as your account may be compromised.
                </div>
            </div>
            
            <div class="footer">
                <p class="company-name">Your Company Name</p>
                <p>This email was sent from an automated system. Please do not reply to this email.</p>
                <p>If you have any questions, contact our support team.</p>
            </div>
        </div>
    </body>
    </html>
  `;

  const textContent = `
    Password Reset Successful
    
    Hello ${userName},
    
    Great news! Your password has been successfully reset.
    You can now log in to your account using your new password.
    
    Security Tips:
    - Keep your password secure and don't share it with anyone
    - Use a unique password that you haven't used elsewhere
    - Consider enabling two-factor authentication for extra security
    - If you notice any suspicious activity, contact us immediately
    
    If you didn't reset your password, please contact our support team immediately.
    
    Best regards,
    Your Company Team
  `;

  const mailOptions = {
    from: {
      name: "Your Company Name",
      address: process.env.EMAIL_USER!,
    },
    to: email,
    subject: "✅ Password Reset Successful",
    text: textContent,
    html: htmlContent,
  };

  try {
    const info = await transporter.sendMail(mailOptions);
    logger.info(
      `Password reset success email sent to ${email}:`,
      info.messageId
    );
    return { success: true, messageId: info.messageId };
  } catch (error) {
    logger.error(
      `Failed to send password reset success email to ${email}:`,
      error
    );
    throw error;
  }
};

export default transporter;
