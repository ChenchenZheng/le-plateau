import consumer from "./consumer";

const notifications = () => {
    const notif = document.getElementById('notifs');
    const id = notif.dataset.event_id;
    consumer.subscriptions.create({ channel: "NotificationChannel", id: id }, {
      received(data) {
       notif.classList.add('active');
      },
    });
}

export { notifications };
