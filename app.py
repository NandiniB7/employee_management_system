from flask import Flask, render_template, request, redirect, session, flash
from database import get_db_connection
from models import Employee, Project
from flask_bcrypt import Bcrypt

app = Flask(__name__)
app.secret_key = "1234"
bcrypt = Bcrypt(app)

# Home Route
@app.route('/')
def index():
    return render_template('login.html')

# Login Route
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT id, name, password FROM employees WHERE email=?", (email,))
        user = cursor.fetchone()
        conn.close()

        if user and bcrypt.check_password_hash(user[2], password):
            session['user_id'] = user[0]
            session['name'] = user[1]
            return redirect('/dashboard')
        else:
            flash("Invalid email or password!", "danger")

    return render_template('login.html')

# Dashboard Route
@app.route('/dashboard')
def dashboard():
    if 'user_id' not in session:
        return redirect('/login')

    user_id = session['user_id']
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM employees WHERE id=?", (user_id,))
    user_data = cursor.fetchone()
    conn.close()

    return render_template('dashboard.html', user=user_data)

# Logout Route
@app.route('/logout')
def logout():
    session.clear()
    return redirect('/')

if __name__ == '__main__':
    app.run(debug=True)
