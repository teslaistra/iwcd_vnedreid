import React, { useEffect, useState, useRef } from "react";
import styles from "./Chat.module.css";

const API_URL = "https://api.lamoda.itatmisis.ru";

export default function Chat() {
  const [sessionId, setSessionId] = useState(null);
  const [messages, setMessages] = useState([]);
  const [input, setInput] = useState("");
  const chatEndRef = useRef(null);

  useEffect(() => {
    const initChat = async () => {
      try {
        const res = await fetch(`${API_URL}/chat/init`, { method: "POST" });
        const data = await res.json();
        setSessionId(data.session_id);
      } catch (error) {
        console.error("Ошибка инициализации чата:", error);
      }
    };
    initChat();
  }, []);

  const sendMessage = async () => {
    if (!input.trim()) return;

    const userMessage = { sender: "user", text: input };
    setMessages((prev) => [...prev, userMessage]);
    setInput("");

    try {
      const res = await fetch(`${API_URL}/chat/message`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          session_id: sessionId,
          message: input,
        }),
      });
      const data = await res.json();

      const botMessage = { sender: "bot", text: data.reply, citations: data.citations || [] };
      setMessages((prev) => [...prev, botMessage]);
    } catch (error) {
      console.error("Ошибка отправки сообщения:", error);
    }
  };

  const handleKeyPress = (e) => {
    if (e.key === "Enter") {
      e.preventDefault();
      sendMessage();
    }
  };

  useEffect(() => {
    chatEndRef.current?.scrollIntoView({ behavior: "smooth" });
  }, [messages]);

  return (
    <div className={styles.chatContainer}>
      <div className={styles.header}>Lamoda AI Chat</div>

      <div className={styles.messages}>
        {messages.map((msg, idx) => (
          <div
            key={idx}
            className={`${styles.messageBubble} ${
              msg.sender === "user" ? styles.user : styles.bot
            }`}
          >
            <div>{msg.text}</div>
            {msg.sender === "bot" && msg.citations && msg.citations.length > 0 && (
              <div className={styles.citations}>
                {msg.citations.map((cit, i) => (
                  <div key={i} className={styles.citationItem}>
                    📖 <a href={cit.source_url} target="_blank" rel="noopener noreferrer">{cit.source_title}</a>
                  </div>
                ))}
              </div>
            )}
          </div>
        ))}
        <div ref={chatEndRef} />
      </div>

      <div className={styles.inputArea}>
        <input
          type="text"
          placeholder="Введите сообщение..."
          value={input}
          onChange={(e) => setInput(e.target.value)}
          onKeyPress={handleKeyPress}
          className={styles.input}
        />
        <button onClick={sendMessage} className={styles.sendButton}>
          Отправить
        </button>
      </div>
    </div>
  );
}
