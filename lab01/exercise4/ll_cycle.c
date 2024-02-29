#include <stddef.h>
#include "ll_cycle.h"

int ll_has_cycle(node *head) {
    if (!head) return 0;
    if (!head->next) return 1;
    node *fast = head->next, *slow = head;
    while (fast != slow) {
        fast = fast->next;
        if (!fast || !fast->next) {
            return 0;
        }
        fast = fast->next;
        slow = slow->next;
    }
    return 1;
}
