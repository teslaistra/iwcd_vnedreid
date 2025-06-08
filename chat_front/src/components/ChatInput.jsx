import { useState } from "react";

const ChatInput = ({ onSend }) => {
  const [inputValue, setInputValue] = useState("");

  const handleSendClick = () => {
    if (inputValue.trim()) {
      onSend(inputValue);
      setInputValue("");
    }
  };

  const handleKeyDown = (e) => {
    if (e.key === "Enter") {
      handleSendClick();
    }
  };

  return (
    <div
      style={{
        display: "flex",
        padding: "10px",
        borderTop: "1px solid #eee",
      }}
    >
      <input
        type="text"
        value={inputValue}
        onChange={(e) => setInputValue(e.target.value)}
        onKeyDown={handleKeyDown}
        placeholder="Сообщение..."
        style={{
          flex: 1,
          padding: "10px",
          borderRadius: "20px",
          border: "1px solid #ccc",
          fontSize: "15px",
        }}
      />
      <button
        onClick={handleSendClick}
        style={{
          marginLeft: "8px",
          padding: "10px 15px",
          borderRadius: "20px",
          backgroundColor: "#000",
          color: "#fff",
          border: "none",
          fontWeight: "bold",
        }}
      >
        Отправить
      </button>
    </div>
  );
};

export default ChatInput;
