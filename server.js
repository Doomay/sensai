const express = require('express');
const bodyParser = require('body-parser');
const { Pool } = require('pg');
const cors = require('cors');

const app = express();
const port = 3000;

app.use(cors());
app.use(bodyParser.json());

// CHANGE THIS BASED ON YOUR POSTGRESSQL SETTINGS
const pool = new Pool({
  user: 'admin',
  host: 'localhost',
  database: 'sensai',
  password: 'admin',
  port: 5432,
});

//#region endpoints | If you need to connect frontend to backend, add more endpoints here.
app.post('/register', async (req, res) => {
  const { name, email, password, gender, weight, height, age, goal, physicalActivity } = req.body;

  try {
    const result = await pool.query(
      'INSERT INTO users (name, email, password, gender, weight, height, age, goal, physical_activity) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING *',
      [name, email, password, gender, weight, height, age, goal, physicalActivity]
    );
    res.status(201).json({ success: true, user: result.rows[0] });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: 'Error registering user' });
  }
});

app.post('/login', async (req, res) => {
  const { email, password } = req.body;

  try {
    console.log(`Searching for user with email: ${email}`);
    
    const result = await pool.query(
      'SELECT * FROM users WHERE email = $1',
      [email]
    );
  
    console.log(`Query executed successfully. Number of users found: ${result.rowCount}`);

    if (result.rows.length === 0) {
      return res.status(404).json({ success: false, message: 'User not found' });
    }

    const user = result.rows[0];

    if (user.password !== password) {
      return res.status(401).json({ success: false, message: 'Incorrect password' });
    }

    const { password: _, ...userWithoutPassword } = user;
    res.status(200).json({ success: true, user: userWithoutPassword });

  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: 'Error logging in' });
  }
});




app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
//#endregion endpoints