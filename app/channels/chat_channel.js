import consumer from "./consumer"

document.addEventListener("DOMContentLoaded", () => {
    const chatId = document.getElementById("chat-id").value;
    const chatChannel = consumer.subscriptions.create(
        { channel: "ChatChannel", chat_id: chatId },
        {
            received(data) {
                // Append new message to chat window
                const messagesContainer = document.getElementById("messages");
                messagesContainer.insertAdjacentHTML("beforeend", `<p>${data.content}</p>`);
            },

            speak(message) {
                this.perform("speak", { message: message });
            }
        }
    );

    document.getElementById("message-form").addEventListener("submit", (event) => {
        event.preventDefault();
        const messageInput = document.getElementById("message-input");
        chatChannel.speak(messageInput.value);
        messageInput.value = '';
    });
});
