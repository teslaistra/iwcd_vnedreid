import "./MessageBubble.css";

const MessageBubble = ({ type, text }) => {
  if (type === "system") {
    return <div className="message-system">{text}</div>;
  }

  if (type === "user") {
    return (
      <div style={{ display: "flex", flexDirection: "column", alignItems: "flex-end" }}>
        <div className="message-user">{text}</div>
        <div style={{ fontSize: "13px", color: "var(--color-text-secondary)", padding: "4px 16px" }}>
          Доставлено
        </div>
      </div>
    );
  }

  if (type === "assistant") {
    return (
      <div style={{ display: "flex", flexDirection: "column", alignItems: "flex-start" }}>
        <div style={{ fontSize: "13px", color: "var(--color-text-secondary)", padding: "4px 16px" }}>
          Помощник
        </div>
        <div className="message-assistant">{text}</div>
      </div>
    );
  }

  if (type === "info") {
    return <div className="message-info">{text}</div>;
  }

  if (type === "button") {
    return (
      <div style={{ display: "flex", justifyContent: "flex-end", paddingLeft: "56px" }}>
        <button
          className="message-button"
          onClick={() => {
            console.log("Перейти к карточке бренда");
          }}
        >
          {text}
        </button>
      </div>
    );
  }

  return null;
};

export default MessageBubble;
