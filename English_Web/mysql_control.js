const mysql = require('mysql');
const express = require('express');
const cors = require('cors');
const app = express();

// 允许跨域请求
app.use(cors());

// 创建数据库连接池
const dataBase = mysql.createPool({
    host: '127.0.0.1',
    user: 'root',
    password: '',
    database: 'learn_english'
});

// 查询单词总数
function getWordNumber() {
    return new Promise((resolve, reject) => {
        dataBase.query('SELECT COUNT(*) as total FROM eng_words', (err, result) => {
            if (err) {
                reject('Error fetching word count: ' + err);
                return;
            }
            resolve(result[0].total);  // 返回单词总数
        });
    });
}

// 生成随机单词 ID
function getRandomWordId(word_number) {
    return Math.floor(Math.random() * word_number) + 1;
}

// 获取单词英文
function getWordEnglishById(id) {
    return new Promise((resolve, reject) => {
        const query = 'SELECT word FROM eng_words WHERE id = ?';
        dataBase.query(query, [id], (err, result) => {
            if (err) {
                reject('Error fetching word: ' + err);
                return;
            }
            if (result.length > 0) {
                resolve(result[0].word);
            } else {
                reject('No word found for id ' + id);
            }
        });
    });
}

// 获取单词中文意思
function getChineseById(id) {
    return new Promise((resolve, reject) => {
        const query = 'SELECT MeaningOfword FROM eng_words WHERE id = ?';
        dataBase.query(query, [id], (err, result) => {
            if (err) {
                reject('Error fetching word meaning: ' + err);
                return;
            }
            if (result.length > 0) {
                resolve(result[0].MeaningOfword);
            } else {
                reject('No meaning found for id ' + id);
            }
        });
    });
}

// 获取单词音标
function getSoundmarkById(id) {
    return new Promise((resolve, reject) => {
        const query = 'SELECT Soundmark FROM eng_words WHERE id = ?';
        dataBase.query(query, [id], (err, result) => {
            if (err) {
                reject('Error fetching word soundmark: ' + err);
                return;
            }
            if (result.length > 0) {
                resolve(result[0].Soundmark);
            } else {
                reject('No soundmark found for id ' + id);
            }
        });
    });
}
// 获取单词例句
function getExampleById(id) {
    return new Promise((resolve, reject) => {
        const query = 'SELECT Example_Sentence FROM eng_words WHERE id = ?';
        dataBase.query(query, [id], (err, result) => {
            if (err) {
                reject('Error fetching word example: ' + err);
                return;
            }
            if (result.length > 0) {
                resolve(result[0].Example_Sentence);
            } else {
                reject('No example found for id ' + id);
            }
        });
    });
}
//添加单词
function addWord(word, meaning, soundmark, example) {
    const query = 'INSERT INTO eng_words (word, MeaningOfword, Soundmark, Example_Sentence) VALUES (?, ?, ?, ?)';
    dataBase.query(query, [word, meaning, soundmark, example], (err, result) => {
        if (err) {
            console.error('Error adding word:', err);
        }
        console.log('Word added successfully');
    });
}



// 获取单词的所有信息
async function getWordDetails() {
    try {
        const word_number = await getWordNumber();
        if (word_number <= 0) {
            throw new Error("No words found in the database.");
        }

        const id = getRandomWordId(word_number);  // 获取随机单词ID
        const wordInfo = await getWordEnglishById(id);
        const meaning = await getChineseById(id);
        const soundmark = await getSoundmarkById(id);
        const example = await getExampleById(id);
        return {
            word: wordInfo,
            meaning: meaning,
            soundmark: soundmark,
            example: example
        };
    } catch (err) {
        console.error('Error fetching word details:', err);
        throw new Error(err);
    }
}

// API端点获取随机单词及其详细信息
app.get('/api/get-random-word', async (req, res) => {
    try {
        console.log("Received request for random word");
        const wordDetails = await getWordDetails();
        
        if (wordDetails) {
            // 生成随机选项
            const options = [wordDetails.meaning];  // 默认正确选项
            // 获取多个随机单词，并从中生成错误选项
            for (let i = 0; i < 3; i++) {
                const randomWord = await getWordDetails();  // 获取另一个单词的意思
                options.push(randomWord.meaning);
            }
            // 随机打乱选项顺序
            const correctOption = wordDetails.meaning;
            const shuffledOptions = options.sort(() => Math.random() - 0.5);

            console.log("Sending word details:", wordDetails);

            res.json({
                word: wordDetails.word,
                correctOption,
                options: shuffledOptions
            });
        } else {
            res.status(500).json({ error: 'No words available.' });
        }
    } catch (err) {
        console.log('Error fetching word details:', err);
        res.status(500).json({ error: 'Error fetching word details: ' + err.message });
    }
});


// 获取单词详细信息
function getWordDetails_2(word) {
    return new Promise((resolve, reject) => {
        const query = 'SELECT * FROM eng_words WHERE word = ?';
        dataBase.query(query, [word], (err, result) => {
            if (err) {
                reject('Error fetching word details: ' + err);
            } else if (result.length === 0) {
                reject('Word not found');
            } else {
                resolve(result[0]);
            }
        });
    });
}

// API端点：获取指定单词的详细信息
app.get('/api/get-word-details', async (req, res) => {
    const word = req.query.word;
    try {
        const wordDetails = await getWordDetails_2(word);  // 获取该单词的详细信息
        res.json(wordDetails);
    } catch (err) {
        res.status(500).json({ error: 'Error fetching word details' });
    }
});

// 启动服务器
app.listen(3000, () => {
    console.log('Server is running on port 3000');
});



