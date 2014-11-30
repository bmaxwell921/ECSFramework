#ifndef ENTITY_H
#define ENTITY_H

namespace ecs {
    class Entity {
        private:
            int id;
        public:
            Entity(int id);
            ~Entity();        
    };
};

#endif
